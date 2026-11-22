import numpy as np

def magia(array, parcial):
    tam = len(array)
    final=parcial/3
    criterios = np.zeros(tam) + 1.0
    print ("evp {0}".format( criterios / tam * parcial))
    print ("evf {0}".format( criterios / tam * final))

agile = [1, 6]
basic = [0, 2, 3, 4, 5]
if 1==0:
    print("ra1 al 30%")
    magia(agile, 15)
    magia(basic, 15)

if 1==0:
    core = [0,1,2,3]
    reverse = [4,5]
    print("ra5 al 40%")
    magia(core, 30)
    magia(reverse, 10)

comporta = [0,1,2,3,4,5,6,7]
print("ra6 al 30")
magia(comporta, 30)
