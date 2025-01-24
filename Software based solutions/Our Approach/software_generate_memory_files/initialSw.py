import numpy as np
with open('out_l_1.txt', 'r') as myfile:
    L1=myfile.read()
number_of_rows_L1=L1.count('\n')
L11= L1.split("\n")
number_of_columns_L1=L11[0].count(' ')+1

string=''
for i in range (number_of_columns_L1):
    string= string+ '0000000000000000000000000000000000'

np.savetxt('IN1.mem', [string], fmt="%s")    