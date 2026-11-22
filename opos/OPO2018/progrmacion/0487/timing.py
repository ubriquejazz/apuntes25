import titulos as titles

def sumar(array):
  suma_total = 0
  for elemento in array:
    if isinstance(elemento, list):
      for sub_elemento in elemento:
        suma_total += sub_elemento
    else:
      suma_total += elemento
  return suma_total

R1 = [9, 6]       # 30% de la evaluaci
R5 = [9, 6]       # 40% de la evaluaci
term1 = [R1, R5, 6]

R2 = [9, 9]       # 60% de la evaluacion
R4 = [9, 3]       # Git, Analizadores
term2 = [R2, 0, R4]

R3 = [6, 15]        # Debug, Unittest
term3 = [0, R3, 9]  # Jenkins, 30%

print("Horas por trimestres:")
print("\t1: R1, R5, R6 = {0} \t\tLa duracion de los elementos es: {1}".format(term1, sumar(term1)))
print("\t2: R2, R3, R4 = {0} \t\tLa duracion de los elementos es: {1}".format(term2, sumar(term2)))
print("\t3: R2, R3, R4 = {0} \t\t\tLa duracion de los elementos es: {1}".format(term3, sumar(term3)))

print("Criterios del R4:")
indices_1 = titles.resultado04['doc'][0]
indices_2 = titles.resultado04['git'][0]
resultado = ','.join(titles.lut[i] for i in indices_1)
resultado += ";" + ','.join(titles.lut[i] for i in indices_2)
print ("\tEn el 2T se evaluan:" + resultado)
indices = titles.resultado04['core'][0]
resultado = ','.join(titles.lut[i] for i in indices)
print("\tEn el 3T se evaluan:" + resultado)