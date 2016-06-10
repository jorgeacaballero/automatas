#Automatas
-
**Proyecto para la clase de Teoría de la Computación**

1. **DFA**

    a. Definir el DFA (Construirlo)

    b. DFA Dibujado

    c. Dado un input determinar si el DFA lo acepta o rechaza

2. **PDA**
    
    a. Definir el PDA (Construirlo)
    
    b. PDA Dibujado + Mostrar movimiento stack
    
    c. Dado un input determinar si el PDA lo acepta o rechaza

3. **TM**

    a. Definir / Construir TM
    
    b. Dibujar TM
    
    c. Dado un input, mostrar las configuraciones de la corrida paso a paso y determinar si acepta o rechaza

##Casos de Prueba

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
