import numpy as np

def magia(array, parcial):
    tam = len(array)
    final=parcial/3
    criterios = np.zeros(tam) + 1.0
    print ("evp {0}".format( criterios / tam * parcial))
    print ("evf {0}".format( criterios / tam * final))

java = [0, 1, 2, 3, 4, 5, 6]
print("ra2 al 60%")
magia(java, 60)

doc = [6, 2, 3]
print("ra4 al 10%")
magia(doc, 10)

git = [5, 7]
print("ra4 al 30%")
magia(git, 30)

