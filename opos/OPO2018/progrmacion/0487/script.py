import numpy as np
import titulos as titles

term1 = [0.3, 0.4, 0.3]     # R1, R5, R6
term2 = [0.6, 0.0, 0.4]     # R2, R3, R4
term3 = [0.0, 0.7, 0.3]     # R2, R3, R4

def redondeo(value):
    return round(value * 100/3, 2)

def peso_total(idx):
    decimal = term2[idx]/3 + term3[idx]/3
    return round(decimal * 100, 2)

print ("Pesos por evaluacion")
print ("\t1: R1, R5, R6 = {0}".format(term1))
print ("\t2: R2, R3, R4 = {0}".format(term2))
print ("\t3: R2, R3, R4 = {0}".format(term3))

print ("Pesos resultados")
print ("\tR1: {0} \t\tR2: {1}".format(redondeo(term1[0]),  peso_total(0)))
print ("\tR3: {0} \t\tR4: {1}".format(peso_total(1), peso_total(2)))
print ("\tR5: {0} \t\tR6: {1}".format(redondeo(term1[1]), redondeo(term1[2])))

print ("R4 por criterios")
indices = titles.resultado04['doc'][0]
resultado = ','.join(titles.criterio[i] for i in indices)
indices = titles.resultado04['git'][0]
resultado += '\t'
resultado += ','.join(titles.criterio[i] for i in indices)
print("\t0.4 en 2T: " + resultado)
indices = titles.resultado04['core'][0]
resultado = ','.join(titles.criterio[i] for i in indices)
print("\t0.3 en 3T: " + resultado)