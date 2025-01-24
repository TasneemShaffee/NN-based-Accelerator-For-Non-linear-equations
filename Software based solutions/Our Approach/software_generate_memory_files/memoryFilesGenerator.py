#script to convert two parser output files to four memory files 

import ctypes
def binRep(num):
    binNum = bin(ctypes.c_uint.from_buffer(ctypes.c_float(num)).value)[2:]
    #print("bits: " + binNum.rjust(32,"0"))
    #mantissa = "1" + binNum[-23:]
    #print("sig (bin): " + mantissa.rjust(24))
    #mantInt = int(mantissa,2)/2**23
    #print("sig (float): " + str(mantInt))
    #base = int(binNum[-31:-23],2)-127
    #print("base:" + str(base))
    #sign = 1-2*("1"==binNum[-32:-31].rjust(1,"0"))
    #print("sign:" + str(sign))
    #print("recreate:" + str(sign*mantInt*(2**base)))
    if (num== 0):
        return '00'+ binNum.rjust(32,"0")
    else:
        return '10'+binNum.rjust(32,"0")






with open('out_l_0.txt', 'r') as myfile:
    L0=myfile.read()
number_of_rows_L0=L0.count('\n')
L00= L0.split("\n")
number_of_columns_L0=L00[0].count(' ')+1



with open('out_l_1.txt', 'r') as myfile:
    L1=myfile.read()
number_of_rows_L1=L1.count('\n')
L11= L1.split("\n")
number_of_columns_L1=L11[0].count(' ')+1



Dummy0= np.zeros([number_of_rows_L0, number_of_columns_L0])
Dummy1= np.zeros([number_of_rows_L1, number_of_columns_L1])



for row in range(number_of_rows_L0):
    dummy= np.fromstring(L00[row], dtype=float , sep=' ')
    for column in range(number_of_columns_L0):
        Dummy0[row][column]= dummy[column] 
        
        
        
        
for row in range(number_of_rows_L1):
    dummy= np.fromstring(L11[row], dtype=float , sep=' ')
    for column in range(number_of_columns_L1):
        Dummy1[row][column]= dummy[column]   
        
        
        
number_of_eqns= number_of_rows_L1
number_of_unknowns=  number_of_columns_L0-1
number_of_nonlinears= number_of_columns_L1 - (number_of_unknowns +1)



R11= np.zeros([number_of_unknowns+2,number_of_columns_L1 ])
R12= np.zeros([number_of_eqns+2,number_of_columns_L1 -1])
R22= np.zeros([number_of_columns_L1, number_of_unknowns])
R21= np.zeros([number_of_columns_L1, number_of_eqns])
DummyMatrix= np.zeros([ number_of_unknowns, number_of_columns_L1])
X= np.zeros(np.shape(Dummy1[:,1:]))



BIAS=Dummy1[:,0]
unknowns_right_to_left= np.zeros([number_of_eqns, number_of_unknowns])
nonlinears_right_to_left= np.zeros([number_of_eqns, number_of_nonlinears])


#//xand f, xandx; layers relation
#BIAS_F= BIAS


for row in range (number_of_rows_L0):
    for column in range (number_of_unknowns):
        R22[row][column]=Dummy0[row][number_of_unknowns-column]

        
DummyMatrix= np.transpose(R22)
for row in range (np.shape(DummyMatrix)[0]):
    for column in range (np.shape(DummyMatrix)[1]):
        R11[np.shape(DummyMatrix)[0]-row-1][np.shape(DummyMatrix)[1]-column-1]=DummyMatrix[row][column]
        

X=Dummy1[:,1:]
x1, x2= np.shape(X)
for row in range (x1):
    for column in range (x2):
        R12[row][column]=X[row][x2-column-1]
        

Y= np.zeros(np.shape(np.transpose(R12))  )      
Y= np.transpose(R12)        
Z= np.zeros(np.shape(Y))         

        
#y1, y2= np.shape(Y)
#for row in range (y1):
#    for column in range (y2):
#        Z[row, column]=Y[row, y2-column-1] 
Z= np.flip(Y, axis=1)
Z1= np.flip(Z[:, 2:], axis=0)
R21[-1,:]=np.flip(BIAS, axis=0)
R21[:-1,:]= Z1

x, y = np.shape(R11)
RR11=[["" for col in range(0,y)] for row in range(0,x)]
for i in range (x):
    for j in range (y):
        RR11[i][j]= binRep(R11[i,j])




#RR11 = np.empty([x, y], dtype="S40")


        
x, y = np.shape(R22)
RR22 = [["" for col in range(0,y)] for row in range(0,x)]
for i in range (x):
    for j in range (y):
        RR22[i][j]= binRep(R22[i,j])

        
        
x, y = np.shape(R12)
RR12 = [["" for col in range(0,y)] for row in range(0,x)]
for i in range (x):
    for j in range (y):
        RR12[i][j]= binRep(R12[i,j])
        
        
        
        
x, y = np.shape(R21)
RR21 = [["" for col in range(0,y)] for row in range(0,x)]
for i in range (x):
    for j in range (y):
        RR21[i][j]= binRep(R21[i,j])
        
        
        
        

np.savetxt('R11.mem', RR11, fmt="%s")
np.savetxt('R22.mem', RR22, fmt="%s")
np.savetxt('R12.mem', RR12, fmt="%s")
np.savetxt('R21.mem', RR21, fmt="%s")