'''
We need to know which neurons will be connected with each weight (roots)
that connect first layer to second layer.So we need to get binary array (np.array).
The parse code creates binary array and coefficients arrays to be passed to NN.
The format of binary coefficient array for example:
[0(bias),1,0,0,1,...,1]
the format of equation cofficient array:
[bias,x1,x2,...,xn,exp-num,exp x1,exp x2,...exp xn]
if there is term like 1e-15 * exp(x1-x2)/0.0025
The parsing of it will be
[bias,x1,x2,...,xn,exp-num,1e-15*1/0.0025,1e-15*-1/0.0025exp x2,...exp xn]
'''
import numpy
from decimal import Decimal
import tensorflow as tf
import numpy as np
from openpyxl.compat import itertools

file = open("21unkowns.txt", "r")
eqs=[[]]
'''
remove the parenthesis 
'''
def getformat(line):
    s=[]
    for i in line:
        if (i not in ("(" , ')',";")):
             s.append(i)
    return s
'''
It Cuts the equation into individual terms.
Here we loop over each character.So the problem is how to concatenate a number like -0.23589776629101  
or number like -1.4578890002222234e-15 as whole number?
Also how to cut x2 as individual term ?
or exp? especially there is an e lewahedaha?
So there are a lot of flags used to handle the most possible cases.
However there is case handled in such different way which need to be preprocessed in getcofficeints function.
the case is (-xi) which is cut off from exp(xi-xj). 
'''
def createeq(line):
 s=[]
 r=""
 counter=0
 neg=""
 flag=0
 flage=0
 e=""
 for i in line:
     if (i not in ("=" , '/',"+","*","-","e","")):
          '''
           handle the cas of -0.12345e,
           it concatenate the nagtive sign withe tha accumulated number with e
           '''
          if flag==1 and flage== 1:
              flag=0
              flage=0
              r=r+e+neg+i
              neg=""
              e=""
          #It concatenate the negatiev numbers with negative sign
          elif flag== 1:
               flag=0
               r=neg+i
          #concatenante postive numbers with e
          elif flage==1:
              r=r+e+i
              flage=0
           #concatenate exp experssion
          elif i in"p":
             s.append((r+i))
             r=""
          #accumulate the given character to perform the required number
          else:
            r=r+i
     elif (i in 'e' and i not in ""):
         flage=1
         e=i
       # you know that this experssion is needed if you met an operator experssion,So the accumulated term is saved in the list
     elif (i in ("=" , '/',"+","*","-") and flage==0 and i not in ""):
          s.append(r)
          s.append(i)
          if i in "-" :
             flag=1
             neg = i
             s.remove(i)
          r = ""
     if (flage==1 and i in "-"):
            neg=i
            e=e+neg
            neg=""
 ''''           
 #There is alaways an end term which is not added in the list because there is no operator after it.
 # hence we check if it is number,convert it directly to float and placed it in list otherwise could be an experssion 
 # like -x2 so it will be placed as string.           
'''
 if r not in "":
   if(isDigit(r)):
    s.append(float(r))
   else:
       s.append(r)
 return s
'''
Check if the string is number or not.
'''
def isDigit(x):
    try:
        float(x)
        return 1
    except:
        return 0
'''
Check if the string is operator or not.
'''
def isoperator(op):
    res=0
    if op in ("=" , '/',"+","*","-","exp") :
      res=1
    return res
def EvaluateOp(op,num,value):
 res = 0
 #if (op not in ""):
 if op in "+":
        res=num+value
 elif op in "*":
        res=num * value
 elif op in "/":
        res=num/value
 print("res",res)
 return res

'''
get cofficients of the equations.
'''
def getCofficients(line,count,max,c2):

    coff=[[0 for i in range(2*(count+2))] for j in range(count)]
    #coff=np.zeros((count,2*(max+2)),dtype=np.float)
    print("size coff",len(coff),len(coff[0]))
    print("size of ",len(line[1]))
    binarycoff=np.zeros((count,2*(count+2)),dtype=np.int)
    arrayexp = [[0 for i in range(count+2)] for j in range(count)]
    index=-1
    num=-1
    secondindex=count
    expstate=0
    expcoffstate=0
    expXstate=0
    coffX=0
    divstate=0
    expoindex=-1
    expodivindex=-1
    expdiv=-1
    xdiv=-1
    div=-1
    numstate=-1
    coff1=-1
    counter=0
    oldindex=-1
    counterexp=0
    negsymp = 0
    indces=[]
    for i in range(0,count):
       print("New equation..................................................")
       counter=0
       expodivindex=-1
       expoindex=-1
       expdiv=0
       divstate=0
       div=0
       expXstate=0
       expstate=0
       numstate=0
       index=-1
       negsymp=0
       negexp=0
       if len(line[i])>0:
        for j in range(2,len(line[i])):
          print("j",j)
          print("element ",line[i][j])
          if (isDigit(line[i][j]) == 1):
             if expstate==1:
                coffX=line[i][j]
                expXstate=1
                print("entered here ",expXstate)
                expstate=0
                counterexp=counterexp+1
                coff1=0
              #  negsymp = 0
             if divstate==1:
                number=1/float(line[i][j])
                divstate=0
                if expodivindex > -1:
                    coff[i][expodivindex] = float(coff[i][expodivindex]) * float(number)
                    binarycoff[i][expodivindex] = 1
                if negexp==1 :
                    if expodivindex > -1:
                     for k in range(0,len(indces)):
                        index = indces[k]
                        if index != expodivindex:
                        #indces.remove(indces[k])
                          print("index for div....",index)
                          coff[i][index] = float(coff[i][index]) * float(number)
                          binarycoff[i][index] = 1
                     indces[:]=[]
                    negsymp=0
                    negexp=0
                print("div index", expodivindex)
             elif div==1:
                 number = 1 / float(line[i][j])
                 div=0
                 coff[i][oldindex] = float(coff[i][oldindex]) * float(number)
                 binarycoff[i][oldindex] = 1
                 print("div indexyy", oldindex)
             elif expXstate == 1:
                 if coff1 == 1:
                     coff[i][count + 1] = 1
                     binarycoff[i][count + 1] = 1
                 else:
                     print("num", num)
                     coff[i][count + 1] = float(num)
                     binarycoff[i][count + 1] = 1
                 arrayexp[i][0] = float(coffX)
                 expXstate = 0
                 xdiv = 1
                 expdiv = 1
                 negexp = 1
             else:
                 numstate=1
                 print("number",num)
                 num=line[i][j]
                 counter=counter+1
          else:
             if line[i][j] not in "":
              string = line[i][j]
              if string[0] in "-":
                  strn=string[1]+string[(2):]
                  print(strn)
                  negsymp=negsymp+1
                  index = getIndex(count, strn)
                  indces.append((index+counter+1))
                  print("indces and counter ",index,counter)
                  print("negsymp",negsymp)

              else:
                  index = getIndex(count,string)
              if index>0:
                  oldindex = index
              print("index of x", index)
              print("iii",index)
              if expXstate == 1 and negexp==0 and index<0:
                  print("opppppppa")
                  if coff1 == 1:
                      coff[i][count+1] = 1
                      binarycoff[i][count+1] = 1
                  else:
                   coff[i][count+1] = float(num)
                   binarycoff[i][count+1] = 1
                  expoindex=index+count+1
                  arrayexp[i][0]=float(coffX)
                  expXstate=0
                  xdiv=1
                  expdiv = 1
                  #expodivindex=index+count+1
                  negexp = 1
              elif (index > 0 and expXstate == 1 and negexp==0):
                  if coff1 == 1:
                      coff[i][index + count+1] = 1
                      binarycoff[i][index+count+1] = 1
                  else:
                   coff[i][index+count+1] = float(num)
                   binarycoff[i][index+count+1] = 1
                  expoindex=index+count+1
                  arrayexp[i][index]=float(coffX)
                  expXstate=0
                  xdiv=1
                  expdiv = 1
                  expodivindex=index+count+1
                  negexp = 1
              elif(index>0 and expstate==1 and negexp==0):
                 print("oooii",count+index+1)
                 coff[i][count+index+1]=float(num)
                 binarycoff[i][index + count + 1] = 1
                 if negsymp>0:
                     arrayexp[i][index] = -1
                 else: arrayexp[i][index] = 1
                 expstate=0
                 xdiv = 1
                 expdiv = 1
                 expoindex = index + count + 1
                 expodivindex = index+count+1
                 negexp=1
                 indces.append(expodivindex)
              elif expXstate==1 and negexp==0 and isoperator(line[i][j])==0:
                 print("just here coff of exp")
                 if coff1==1:
                     coff[i][count+1] =1
                 else:
                  coff[i][count+1] = float(num)
                 arrayexp[i][0] = 1
                 expXstate=0
                 binarycoff[i][count + 1] = 1
                 expodivindex = index + count+1
              elif (index > 0 and negexp==0):
                  coff[i][index] = float(num)
                  binarycoff[i][index] = 1
                  expodivindex = index
              elif line[i][j] in "exp":
                 expstate=1
                 if isoperator(op):
                     coff1=1
              elif line[i][j] in "/" and xdiv==1 and expdiv==1:
                  divstate=1
                  xdiv=0
                  expdiv=0
              elif line[i][j] in "/" and numstate==1:
                  div=1
                  numstate=0
              elif negexp==1 and index>0:
                  coff[i][count + index + 1] = float(num)
                  binarycoff[i][index + count + 1] = 1
                  if negsymp >0:
                      arrayexp[i][index] = -1
                  else:
                      arrayexp[i][index] = 1
                  expstate = 0
                  xdiv = 1
                  expdiv = 1
                  expodivindex = index + count + 1
                 # negexp = 1
                  indces.append(expodivindex)
                  print("hiiiii",expodivindex)
                  #negsymp=0
       # if len(line[i])>0:
        op=line[i][j]
        print("negexp",negexp)
         # print("index",index)
          #print("coff", coff[i][counter])
          #print("exp array",arrayexp[i][counterexp])
        if (isDigit(num)==1):
           coff[i][0]=float(num)
           print("last coff", coff[i][max])
    return coff,arrayexp,binarycoff

def createNN(line,count):
    w_first_layer=[]
    w_second_layer=[]
    #for i in range(0,4):
    with tf.name_scope("hidden_1"):
      for j in (0,count):
          w_first_layer.append(tf.Variable(0.2, name="w"+str(j)))
    with tf.name_scope("hidden_2"):
       coff=getCofficients(line)
       for i in range(0,len(coff)):
           w_second_layer.append(tf.Variable(coff[i], name="w2"+str(j),trainable=False))
    return

def getIndex(count,x):
    i=-1
    for j in range(1,count+1):
        print("j in anothe function",j)
        if (x in ("x"+str(j))):
            i=j
            break
        j=j+1
    return i
def highPrecedence(i):
    res=0

    if i in ("*","/"):
        res=1
    return res
def getexpcount(line):
    count=0
    for i in line:
        if str(i) in "exp" and i not in "":
          count=count+1
    return count
def getCoffCount(line):
   count=0
   for i in line:
       if(isDigit(i)):
         count=count+1
   return count

eq=[]
count=0;
max=-1
getcoffcount=0
maxexp=-1
for line in file:
    # remove all possible white spaces from the equations string
    t=line.strip()
    t = t.replace(" ", "")
    print(t)
    count=count+1
    # remove all parentheses
    eq = getformat(t)
    #cut the equation into individual terms
    r = createeq(eq)
    #r=[i for i in r if i != '']
    #r[:]=(i for i in r if i != '')
    '''get the number of coefficient of possible,This because i need to get the maximum number of  
    cofficients and create array with this size *2.
    The format of the array is coff=[constant/bias, x1,x2,x3,..,xn,exp(-num),exp(x1),exp(x2),..,exp(xn)]
    '''
    c1=getCoffCount(r)
    c2=getexpcount(r)
    '''
    create 2D array(list of lists) if we have 7 equations ,
    the array will have 7 entries and each entry has list of its equation terms
    '''
    eqs.append(r)
    if(max<c1):
        max=c1
    if (maxexp<c2):
        maxexp=c2

'''
it is found that after reading the lines and parsing the equation terms
eqs[0]=[]=>empty list 
so before any processing on the parsed terms,we must check that all empty listas 
are removed to skip any possible errors. 
'''
for j in eqs:
    if len(j)==0:
        eqs.remove(j)

for i in eqs:
    print("oj",i)
'''
call the function to get all possibl cofficients for NN.
The returned arrays are: binary array (zero for weights that will not be connected to the following neurons otherwise 1)  
coff arrays which is array contains all cofficients of the equation terms.
arrayexp is an array contains the cofficients of exp(ci * xi)
'''
coff,arrayexp,binarrycoff=getCofficients(eqs,count,max,maxexp)

print("the list is")
for j in coff:
    print(j)
print("The coff")
for j in binarrycoff:
    print(j)
print("The coff of exponents")
for j in arrayexp:
    print(j)