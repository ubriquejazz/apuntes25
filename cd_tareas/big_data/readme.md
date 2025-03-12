
# Un mundo feliz

- [Recurso](https://edea.juntadeandalucia.es/bancorecursos/file/dabca0ce-715d-400e-9140-f2d63de957b4/1/CDI_1BAC_REA_06_v01.zip/index.html)

## Machine Learning

## Pildora sobre IA

Lo primero que debemos saber es que cuando interactuamos con ChatGPT, DeepSeek, Gemini u otros asistentes similares, estamos dialogando con aplicaciones que utilizan internamente modelos de un tipo llamado LLM (Large Language Model). Estos se basan en técnicas de aprendizaje profundo para entender y generar texto basado en grandes conjuntos de datos

Se distinguen por ser generativos y estadísticos. Significa que van generando una respuesta palabra por palabra, tratando de predecir cuál es la siguiente palabra en la frase según la probabilidad estadística que tienen unas palabras de aparecer en el mismo contexto que otras. Esa es la magia.

Abstractamente, podemos tratarlos como una máquina que recibe una entrada (como hacer una pregunta por el chat), procesa la información y devuelve una respuesta:

Glosario de términos:

    Temperatura: resulta que esta probabilidad estadística se puede graduar para configurar el modelo de forma más creativa o más rigurosa. Algunas aplicaciones nos dan esta opción.

    Prompt: eso que le dices al modelo cuando interactúas con él mediante el chat por ejemplo.

    Token: la unidad más pequeña en que internamente se dividen las palabras. La máquina las usa para poder codificar y procesar esa información. Una de las limitaciones más habituales de las versiones gratuitas es el número de tokens que nos dejan introducir cada día.

    Parámetros: son los ajustes internos que el modelo utiliza para aprender de los datos y realizar predicciones o decisiones. Cada nuevo modelo que sale tiene más miles de millones de parámetros.

    Contexto: imagina que estás hablando con alguien: si conoces el tema de la conversación y lo que se ha dicho antes, puedes responder de manera más acertada. Lo mismo le pasa a la IA, el contexto es la información adicional que la IA usa para ser más precisa y útil. Esta información, es lo que hemos ido hablando en la misma ventana previamente y forma parte de la entrada junto a lo que introducimos en el prompt. Además, parte del mismo también podemos configurarlo para que esté precargado en las futuras sesiones, por ejemplo, indicarle que soy un profesor y cómo son mis alumnos. Pero aún hay más, las respuestas también forman parte del contexto para la siguiente consulta. Sin embargo, podríamos decir que la IA tiene mala memoria pues este contexto no es muy extenso y conforme se va desbordando va olvidando lo del principio.

    Entrenamiento: las empresas, antes de sacar un modelo al público, configuran sus algoritmos y parámetros para mejorarlos, se les dan datos (todo eso que dejamos en Internet), se les hacen preguntas y devuelven resultados que son evaluados para obtener modelos cada vez más avanzados. Esto puede llevar un tiempo y cuando se lanza al mercado ya no cambia ni aprende más.

    Fine-tuning: pensemos en un modelo pre-entrenado como en un libro ya escrito que no vamos a modificar, pero podemos extenderlo añadiendoles nuestras notas o apuntes. Esta personalización o afinamiento especializa al modelo para tareas más específicas. 


    Funciones o Tools: herramientas a las que tienen acceso los modelos. Por ejemplo, generación de voz, reconocimiento de imágenes, etc. 


    Agentes: son sistemas autónomos que pueden percibir su entorno, tomar decisiones y realizar acciones sin intervención humana constante, usando las funciones. Ejemplo: convocar reuniones o responder un email por ti.

    Modelos razonadores: son una evolución de los modelos para realizar tareas más complejas (como matemáticas, programación, lógica, etc.). Tardan más tiempo en dar una respuesta.

    Búsqueda en la web: el modelo ya está entrenado y no tiene información actualizada, para ello muchos permiten activar la búsqueda web.

    Deep research: esta funcionalidad permite buscar en centenares de páginas en lugar de en unas pocas como la búsqueda en la web normal, además suelen usar modelos razonadores, pero es más lento.

    RAG: técnica para procesar información externa (como pasarle un documento o un libro) y permite generar respuestas más precisas (pero como siempre puede equivocarse, porque en realidad trabaja con fragmentos del documento).

    Few-shot: técnica que consiste en dar ejemplos ya hechos para que entienda más claramente qué le pedimos.

    Alucinación: fenómeno donde un modelo de IA genera información incorrecta o inventada presentándola como real.


Consejos:

    Las aplicaciones van y vienen, no tiene sentido aprender a usar unas en concreto, sino conocer los principios subyacentes, que no suelen cambiar tanto y nos permiten inferir el uso de cualquier aplicación presente y futura.

    Tampoco tiene sentido aprender a crear un prompt, puesto que podemos consultarlos en una web o pedir a una IA con nuestras palabras que lo cree. Sí es interesante que anotemos los que usamos cotidianamente y nos funcionan a nosotros, para poder reutilizarlos o incluso ir mejorándolos y ahorrar tiempo.

    Cuanto mayor sea el contexto (más hayamos chateado en la ventana) más lento y peor calidad de las respuestas vamos a tener porque lo “distraemos”. Se recomienda usar una nueva ventana para iniciar un nuevo tema. Podemos volver a copiar y pegar parte de las conversaciones que hemos tenido para recordarle el contexto. Estas conversaciones suelen guardarse en tu histórico si iniciaste sesión.

    Aunque en general los LLM tratan de responder a cuestiones genéricas y hacer muchos tipos de tareas, hay modelos que están entrenados para fines más concretos (programación, literatura, arte, matemáticas, etc.). Es interesante usar el más apropiado en cada caso. [Listado]

    El aprendizaje humano es un proceso que requiere tiempo y no tiene atajos. Esto sigue siendo así, por eso es mala praxis (como se observa en los alumnos) hacer consultas y tareas que no se entienden y copiar las soluciones con fines meramente resultistas. La IA es una herramienta valiosa cuando tenemos ya unos ciertos conocimientos sobre lo que queremos y la usamos como asistente.

    Cuanto más información haya en Internet sobre un tema mejores resultados. Por ejemplo, si pedimos que resuelva una operación matemática poco común, es normal que falle y depende del modelo creará un programa que la resuelve o buscará predecir el resultado en función de sus datos de entrenamiento.

    Los modelos no son infalibles, es importante revisar y contrastar lo que generan.

## Recursos

- [Machine Learning](https://machinelearningforkids.co.uk/)
- [Aprendiendo IA](https://davidlms.github.io/formacion-profesorado-ia-aprendizaje/)