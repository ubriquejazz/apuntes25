import numpy as np

def magia(array, parcial):
    tam = len(array)
    final=parcial/3
    criterios = np.zeros(tam) + 1.0
    print ("evp {0}".format( criterios / tam * parcial))
    print ("evf {0}".format( criterios / tam * final))

# ra3 al 30%
debug=[2,3,4]
print("ra3 al 30%")
magia(debug, 30)

# ra3 al 40%
unit=[0,1,5,6,7,8]
print("ra3 al 40%")
magia(unit, 40)

# ra4 al 30%
jenkins=[0, 1, 4, 8]
print("ra4 al 30%")
magia(jenkins, 30)

