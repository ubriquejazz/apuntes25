import json

ed = "entornos de desarrollo"
ee = ed + " especificos"
gui = "ifaces graficos de usuario"

# codigos criterios:
# a b c d e f g h i
# 0 1 2 3 4 5 6 7 8
criterio = ['a','b','c','d','e','f','g','h','i']

# unidad es un array tipo [criterios, titulo]
resultado01 = {
    'core': [[0, 2, 3, 4, 5], "Fundamentos de la programacion"],
    'agile': [[1,6],"Desarrollo de software y metodologias de trabajo"]
}
resultado02 = {
    'core': [range(7), "Desarrollo en C/C++ con VSCode"], 
    'java': [range(7), "Desarrollo en Java con IntelliJ"], 
}
resultado03 = {
    'debug': [[2,3,4], "herr de depuracion"],
    'core': [[0,1,5,6,7,8], "Pruebas unitarias y automatizacion"]
}
resultado04 = {
    'doc': [[6, 2, 3], "Documentacion y analizadores de codigo"],
    'git': [[5, 7],  "Desarrollo colaborativo con Git"],
    'core': [[0, 1, 4, 8], "Refactorizacion, pruebas e integracion continua"]
}
resultado05 = {
    'core': [[0,1,2,3], "Fundamentos de la POO y modelado"],
    'reverse': [[4,5], "Generacion de codigo e ingenieria inversa"]
}

coletilla = "valorando su importancia en el desarr de apls y empleando herr especificas"

resultados = {
    "1. Reconoce los elementos y herr que intervienen en el desarrollo de un programa, \
        analizando sus ccas y las fases hasta llegar a su puesta en funcionamiento.",
    "2. Evalua ides analizando sus ccas para editar código fuente y generar ejecutables.",
    "3. Verifica el funcionamiento de programas diseñando y realizando pruebas",
    "4. Optimiza código empleando las herr disponibles en el " + ed,
    "5. Genera diagramas de clases " + coletilla,
    "6. Genera diagramas de comportamiento " + coletilla,
}

def test1():
    print(json.dumps(resultado05, indent = 4))
    #    print ("UD{0}: {1}".format(i, resultado04[i]))

