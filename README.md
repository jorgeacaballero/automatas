#Autómatas

##Introducción

El siguiente proyecto consiste en el desarrollo de una aplicación web que permita ingresar, validar y ejecutrar autómatas. Los autómatas a desarrollar son: DFA, PDA y TM.

Para este proyecto se ha elegido usar un backend de [Ruby](https://www.ruby-lang.org/en/) con el framework [Ruby on Rails](http://rubyonrails.org/). En frontend se utilizó el CSS framework [Materialize](http://materializecss.com/) y el graph framework de [Cytoscape](http://js.cytoscape.org/).

##Marco Teórico

###Lenguajes Regulares
Los lenguajes regulares, de tipo 3 según la jerarquía de Chomsky, son aquellos que son reconocidos por autómatas de estados infinitos, son denotados por expresiones regulares y generados por gramáticas regulares. Estos lenguajes contienen a todos los lenguajes infinitos generados a partir de cualquier alfabeto. Los lenguajes infinitos tipificados como regulares poseen ciertas propiedades que los caracterizan y distinguen de otros lenguajes más complejos.

#####DFA
```
Un DFA es una quíntupla A = (Q , Σ, δ, q0, F), siendo:
Q = conjunto finito de estados.
Σ = conjunto finito de símbolos del alfabeto.
q0 = es el estado inicial (denotado con flecha → a inicio)
F = conjunto de estados finales (o estados de aceptación), F ⊆ Q
δ = La función de transición entre estados, δ: Q x Σ → Q.
```

###Gramáticas Libres de Contexto
Las gramáticas libres de contexto amplían la capacidad para especificar lenguajes al incluir algunos lenguajes que no son reconocidos por un autómata finito.
 
Las gramáticas libres de contexto son útiles para describir expresiones aritméticas que tengan una anidación arbitraria de paréntesis balanceados y estructuras de bloque en los lenguajes de programación.

#####PDA
```

Un PDA es una seis-tupla A = (Q , Σ, Γ, δ, q0, F), siendo:
Q = conjunto finito de estados.
Σ = conjunto finito de símbolos del álfabeto.
Γ = conjunto finito del alfabeto de la pila.
δ = La función de transición entre estados, δ: Q x Σ x Γ  → P(QxΓ).
q0 = es el estado inicial (denotado con la flecha → a inicio)
F = conjunto de estados finales (o estados de aceptación), F ⊆ Q
```

###Máquina de Turing
Una máquina de Turing es un dispositivo que manipula símbolos sobre una tira de cinta de acuerdo a una tabla de reglas. A pesar de su simplicidad, una máquina de Turing puede ser adaptada para simular la lógica de cualquier algoritmo de computador y es particularmente útil en la explicación de las funciones de una CPU dentro de un computador.

Originalmente fue definida por el matemático inglés Alan Turing como una «máquina automática» en 1936, en la revista Proceedings of the London Mathematical Society, La máquina de Turing no está diseñada como una tecnología de computación práctica, sino como un dispositivo hipotético que representa una máquina de computación. Las máquinas de Turing ayudan a los científicos a entender los límites del cálculo mecánico.


#####TM
```
Un DFA es una siete-tupla A = (Q , Σ, Γ, δ, q0, qa, qr), siendo:
Q = Conjunto finito de estados.
Σ = Conjunto finito del alfabeto de entrada. No contiene el símbolo blanco ' '.
Γ = Conjunto finito del alfabeto de la cinta donde ' ' ∈ Γ y Σ ⊂ Γ.
δ = La función de transición entre estados, δ: Q x Γ  → Q x Γ x {L,R}.
q0 = Es el estado inicial (denotado con flecha → a inicio)
qa = Estado final de aceptación, qa ∈ Q
qr = Estado final de rechazo, qr ∈ Q
```


##Alcance del Proyecto

**Proyecto para la clase de Teoría de la Computación**

El sistema es capaz de las siguientes funciones:

1. **DFA**

    a. Definir el DFA (Construirlo): Se recibe del usuario los parámetros que se ingresan a la definición formal del DFA. Al terminar este proceso, se le muestra al usuario una tabla con la definición formal del DFA creado.

    b. DFA Dibujado: Al mostrarle al usuario la definición formal del DFA, se le muestra también un dibujo del mismo, basado en los mismos parámetros recibidos anteriormente.

    c. Computación & Animación: Dado un input determinar si el DFA lo acepta o rechaza, animar el grafo segun la cadena de entrada. Se le permite al usuario ingresar una cadena para que pueda ver el proceso animado del DFA al momento de evaluar la cadena.

2. **PDA**
    
    a. Definir el PDA (Construirlo): Se recibe del usuario los parámetros que se ingresan a la definición formal del PDA. Al terminar este proceso, se le muestra al usuario una tabla con la definición formal del PDA creado.
    
    b. PDA Dibujado: Al mostrarle al usuario la definición formal del PDA, se le muestra también un dibujo del mismo, basado en los mismos parámetros recibidos anteriormente.
    
    c. Computación & Animación: Dado un input determinar si el PDA lo acepta o rechaza, animar el grafo segun la cadena de entrada. Se le permite al usuario ingresar una cadena para que pueda ver el proceso animado del PDA al momento de evaluar la cadena. Adicionalmente, el usuario puede observar los movimientos del Stack.


3. **TM**

    a. Definir / Construir TM: Se recibe del usuario los parámetros que se ingresan a la definición formal de la TM. Al terminar este proceso, se le muestra al usuario una tabla con la definición formal de la TM creada.
    
    b. Dibujar TM: Al mostrarle al usuario la definición formal de la TM, se le muestra también un dibujo de la mismo, basada en los mismos parámetros recibidos anteriormente.
    
    c. Computación & Animación: Dado un input determinar si el PDA lo acepta o rechaza, animar el grafo segun la cadena de entrada. Se le permite al usuario ingresar una cadena para que pueda ver el proceso animado del PDA al momento de evaluar la cadena. Adicionalmente, el usuario puede observar las configuraciones de la TM en el momento de ejecución.


##Tecnologías

###Ruby

Ruby es un lenguaje de programación interpretado, reflexivo y orientado a objetos, creado por el programador japonés Yukihiro "Matz" Matsumoto, quien comenzó a trabajar en Ruby en 1993, y lo presentó públicamente en 1995. Combina una sintaxis inspirada en Python y Perl con características de programación orientada a objetos similares a Smalltalk. Comparte también funcionalidad con otros lenguajes de programación como Lisp, Lua, Dylan y CLU. Ruby es un lenguaje de programación interpretado en una sola pasada y su implementación oficial es distribuida bajo una licencia de software libre.

###Ruby on Rails

Ruby on Rails, también conocido como RoR o Rails, es un framework de aplicaciones web de código abierto escrito en el lenguaje de programación Ruby, siguiendo el paradigma de la arquitectura Modelo Vista Controlador (MVC). Trata de combinar la simplicidad con la posibilidad de desarrollar aplicaciones del mundo real escribiendo menos código que con otros frameworks y con un mínimo de configuración. El lenguaje de programación Ruby permite la metaprogramación, de la cual Rails hace uso, lo que resulta en una sintaxis que muchos de sus usuarios encuentran muy legible. Rails se distribuye a través de RubyGems, que es el formato oficial de paquete y canal de distribución de bibliotecas y aplicaciones Ruby.

###Materialize

Un framework de CSS es una librería de estilos genéricos que puede ser usada para implementar diseños web. Aportan una serie de utilidades que pueden ser aprovechadas frecuentemente en los distintos diseños web.

Material design es una normativa de diseño enfocado en la visualización del sistema operativo Android, además en la web y en cualquier plataforma. Fue desarrollado por Google y anunciado en la conferencia Google I/O celebrada el 25 de junio de 2014. Ampliando la interfaz de tarjetas vista por primera vez en Google Now.

Material se integró en Android Lollipop como reemplazo de Holo, anteriormente utilizado desde Android 4 y sucesores. La filosofía también se aplicó en Google Drive y Google Docs, Sheets y Slides, y se irá extendiendo progresivamente a todos los productos de Google (incluyendo Google Search, Gmail y Google Calendar), proporcionando una experiencia consistente en todas las plataformas. Google también lanzó APIs para que los desarrolladores externos incorporaran Material Design a sus aplicaciones.

Creado y diseñado por Google, Material diseño es un lenguaje de diseño que combina los principios clásicos del diseño exitoso, junto con la innovación y la tecnología. El objetivo de Google consiste en desarrollar un sistema de diseño que permite una experiencia de usuario unificada a través de todos sus productos en cualquier plataforma.

###Cytoscape.js

Cytoscape es una plataforma de software de bioinformática de código abierto para la visualización de las redes de interacción molecular y la integración con los perfiles de expresión génica y otros datos de estado. Las características adicionales están disponibles como plugins. Plugins están disponibles para la red y análisis de perfiles moleculares, nuevos diseños, formatos de archivos adicionales y la conexión con bases de datos y buscar en grandes redes. Plugins pueden ser desarrollados utilizando la arquitectura de software de Java abierta Cytoscape por cualquier persona y de la comunidad plugin de desarrollo se anima. Cytoscape también tiene un proyecto hermana JavaScript centrada llamado Cytoscape.js que se puede utilizar para analizar y visualizar gráficos en entornos de JavaScript, como un navegador.



##Modo de Uso

####DFA
![Imgur](http://i.imgur.com/02cKFoF.png "Create DFA")
![Imgur](http://i.imgur.com/CM6BTz0.png "Compute DFA")
![Imgur](http://i.imgur.com/kP9xq9h.gif "Consume DFA")

####PDA
![Imgur](http://i.imgur.com/xKncqrE.png "Create PDA")
![Imgur](http://i.imgur.com/EHkx26B.png "Compute PDA")
![Imgur](http://i.imgur.com/K6f3E3D.gif "Consume PDA")

####TM
![Imgur](http://i.imgur.com/uv0tWSn.png "Create TM")
![Imgur](http://i.imgur.com/B4lOHtM.png "Compute TM")
![Imgur](http://i.imgur.com/1C79drB.gif "Consume TM")

##Repositorio

El codigo fuente del proyecto puede ser encontrado en este repositorio en [Github](https://github.com/jorgeacaballero/automatas)


##Trabajo futuro

- Para un futuro, se recomienda crear cuentas de usuario donde el usuario puede guardar los automatas que crea en la plataforma.
- Poder guardar pruebas de corridos de los inputs a consumir.
- Poder exportar como pdf o archivo de texto el resultado de un automata.

##Fuentes

- [1. Gramaticas Libres de Contexto](http://match50.tripod.com/)
- [2. Máquina de Turing](https://es.wikipedia.org/wiki/M%C3%A1quina_de_Turing)
- [3. CSS frameworks](https://en.wikipedia.org/wiki/CSS_frameworks)
- [4. Material design](https://es.wikipedia.org/wiki/Material_design)
- [5. Materialize](http://materializecss.com/about.html)
- [6. Deterministic Finite Automata](http://homes.di.unimi.it/~alberti/colos/AUTOMATAHT/TUTORIAL/deterministic.html)
- [7. Finite Automata](http://www.eecs.wsu.edu/~ananth/CptS317/Lectures/FiniteAutomata.pdf)
- [8. Ruby](https://www.ruby-lang.org/en/)
- [9. Ruby on Rails](http://rubyonrails.org/)
- [10. Cytoscape](http://js.cytoscape.org/)
- [11. DFA](http://www.cse.chalmers.se/~coquand/AUTOMATA/o2.pdf)
- [12. PDA](http://infolab.stanford.edu/~ullman/ialc/spr10/slides/pda1.pdf)
- [13. Turing Machine](https://www.cse.iitb.ac.in/~akshayss/lecture1.pdf)
