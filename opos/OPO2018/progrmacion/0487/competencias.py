import json

ed = "entornos de desarrollo"
ee = ed + " especificos"
gui = "ifaces graficos de usuario"

desarrollo = [
    "aplicaciones web con acceso a bases de datos",
    gui + " en aplicaciones multiplataforma",
    "juegos y aplicaciones en el ambito del entretenimiento",
    "aplicaciones en dispositivos inteligentes (iphone, tablet)",
    "aplicaciones multiproceso y multihilo"]

# codigo objetivos
# d e h i j n
# 0 1 2 3 4 5 
objetivo = ['d', 'e', 'h', 'i', 'j', 'n', 'o']

objetivos= [
    "instalar modulos y complementos para gestionar el " + ed,
    "seleccionar lenguajes, herr y librerias para " + desarrollo[0],
    "emplear herr de desarrollo, lenguajes y componentes visuales para " + desarrollo[1],
    "emplear motores y entornos evaluando sus posibilidades para participar en el " + desarrollo[2],
    "emplear lenguajes y entornos evaluando sus posibilidades para participar en el " + desarrollo[3],
    "aplicar tecnicas y librerias, evaluando su funcionalidad para " + desarrollo[4],
    "reconoce la estructura de los sistemas ERP/CRM identificando la utilidad de sus modulos"
]

def di_objetivos():
    indices = [0, 1, 2, 5, 6]
    #print(','.join(criterio[i] for i in indices))
    print('\n'.join(objetivo[i] + ") " + objetivos[i] for i in indices))

# codigo competencias DAM
# d f h i j m
# 0 1 2 3 4 5 
competencia = ['d', 'f', 'h', 'i', 'j', 'm']

gral = "desarr, implantar y mantener aplicaciones web \n\
    garantizando el acceso a los datos de forma segura \n\
    cumpliendo criterios de "

competencias = [
    "gestionar " + ed + " adaptando su config en cada caso para permitir el desarrollo y despliegue de aplicaciones",
    "desarrollar un sistema completo de formularios que permitan gestionar la informacion almacenada",
    "desarrollar " + gui + " interactivos, empleando componentes visuales standard o implementando especificos",
    "participar en el desarrollo de juegos empleando tecnicas, motores y " + ee,
    "desarrollar aplicaciones para dispositivos inteligentes empleando tecnicas y " + ee,
    "empaquetar aplicaciones para su distr. preparando auto-instalables con asistentes incorporados"
]

def di_competencias():
    indices = [0, 1, 2]
    #print(','.join(criterio[i] for i in indices))
    print('\n'.join(competencia[i] + ") " + competencias[i] for i in indices))

di_objetivos()
print("\nCompetencias:")

print("General del titulo:")
print("\t" + gral + "accesibilidad, usabilidad y calidad")

print("C. profesionales, personales y sociales:")
di_competencias()