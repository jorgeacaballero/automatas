#Automatas

##Introducción

El siguiente proyecto consiste en el desarrollo de una aplicación web que permita ingresar, validar y ejecutrar automatas. Los automatas a desarrollar son: DFA, PDA y TM.

Para este proyecto se ha elegido usar un backend de [Ruby](https://www.ruby-lang.org/en/) con el framework [Ruby on Rails](http://rubyonrails.org/). En frontend se utilizo el css framework [Materialize](http://materializecss.com/) y el graph framework de [Cytoscape](http://js.cytoscape.org/).

##Marco Teórico

###Lenguajes Regulares
Los lenguajes regulares, de tipo 3 según la jerarquía de Chomsky, son aquellos que son reconocidos por autómatas de estados infinitos, son denotados por expresiones regulares y generados por gramáticas regulares. Estos lenguajes contienen a todos los lenguajes infinitos generados a partir de cualquier alfabeto. Los lenguajes infinitos tipificados como regulares poseen ciertas propiedades que lo caracterizan y distinguen de otros lenguajes más complejos.

#####DFA
```
Un DFA es una quíntupla A = (Q , Σ, δ, q0, F), siendo:
Q = conjunto nito de estados.
Σ = conjunto nito de símbolos del alfabeto.
q0 = es el estado inicial (denotado con echa → a inicio)
F = conjunto de estados nales (o estados de aceptación), F ⊆ Q
δ = La función de transición entre estados, δ: Q x Σ → Q.
```

###Gramaticas Libres de Contexto
Las gramáticas libres de contexto amplían la capacidad para especificar lenguajes al incluir algunos lenguajes que no son reconocidos por un autómata finito.
 
Las gramáticas libres de contexto son útiles para describir expresiones aritméticas que tengan una anidación arbitraria de paréntesis balanceados y estructuras de bloque en los lenguajes de programación.

#####PDA TODO
```
Un PDA es una seis-tupla A = (Q , Σ, Γ, δ, q0, F), siendo:
Q = conjunto nito de estados.
Σ = conjunto nito de símbolos del álfabeto.
Γ = conjunto nito es el álfabeto de la pila.
q0 = es el estado inicial (denotado con echa → a inicio)
F = conjunto de estados nales (o estados de aceptación), F ⊆ Q
δ = La función de transición entre estados, δ: Q x Σ x Γ  → P(QxΓ).
```

###Maquina de Turing
Una máquina de Turing es un dispositivo que manipula símbolos sobre una tira de cinta de acuerdo a una tabla de reglas. A pesar de su simplicidad, una máquina de Turing puede ser adaptada para simular la lógica de cualquier algoritmo de computador y es particularmente útil en la explicación de las funciones de una CPU dentro de un computador.

Originalmente fue definida por el matemático inglés Alan Turing como una «máquina automática» en 1936, en la revista Proceedings of the London Mathematical Society, La máquina de Turing no está diseñada como una tecnología de computación práctica, sino como un dispositivo hipotético que representa una máquina de computación. Las máquinas de Turing ayudan a los científicos a entender los límites del cálculo mecánico.


#####TM TODO
```
Un DFA es una quíntupla A = (Q , Σ, δ, q0, F), siendo:
Q = conjunto nito de estados.
Σ = conjunto nito de símbolos del alfabeto.
q0 = es el estado inicial (denotado con echa → a inicio)
F = conjunto de estados nales (o estados de aceptación), F ⊆ Q
δ = La función de transición entre estados, δ: Q x Σ → Q.
```


##Alcance del Proyecto

**Proyecto para la clase de Teoría de la Computación**

El sistema es capaz de las siguientes funciones:

1. **DFA**

    a. Definir el DFA (Construirlo) TODO Explicar mas

    b. DFA Dibujado TODO Explicar mas

    c. Dado un input determinar si el DFA lo acepta o rechaza, animar el grafo segun la cadena de entrada. TODO Explicar mas

2. **PDA**
    
    a. Definir el PDA (Construirlo) TODO Explicar mas
    
    b. PDA Dibujado + Mostrar movimiento stack TODO Explicar mas
    
    c. Dado un input determinar si el PDA lo acepta o rechaza, animar el grafo segun la cadena de entrada. TODO Explicar mas


3. **TM**

    a. Definir / Construir TM TODO Explicar mas
    
    b. Dibujar TM TODO Explicar mas
    
    c. Dado un input, animar el grafo segun la cadena de entrada. TODO Explicar mas


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

Para preparar el servidor, navegar al directorio donde se encuentra el proyecto y correr `bundle install` seguido por `rails s`. Navegar a [http://localhost:3000/](http://localhost:3000/).

Como pantalla principal se encuentra 

##Funciones Internas

### NFA

La siguiente NFA acepta el lenguaje `a* + (ab)*`

1. Inicializar la NFA

    `nfa = NfaHelper::NFA.new()`

2. Definir los parametros de cada tupla:

    ```
    nfa.states = ['A', 'B', 'C', 'D']
    nfa.alphabet = ['a', 'b']
    nfa.start = 'A'
    nfa.accept = ['A', 'B', 'D']
    nfa.transitions = {"A"=>{"a"=>["B", "C"]}, "B"=>{"a"=>"B"}, "C"=>{"b"=>"D"}, "D"=>{"a"=>"C"}}
    ```

3. Para probar la maquina, usamos la funcion booleana `accepts?` de la siguiente manera:

    ```
    nfa.accepts? 'a'
     => true
    nfa.accepts? 'ab'
     => true
    nfa.accepts? 'aba'
     => false
    nfa.accepts? 'abaababababa'
     => false
    nfa.accepts? 'ababab'
     => true
    nfa.accepts? 'abababababab'
     => true
    ```

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
- [11.]()
- [12.]()
- [13.]()
- [14.]()
