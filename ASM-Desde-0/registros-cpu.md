# Registros de una CPU intel x86

## - ¿Que es un registro?
En nuestra `CPU` podemos encontrar unas "memorias" especiales que se llaman registros, hay gente que los llaman tambien celdas. Estas son mas rapidas que la `RAM` pero tiene un menor tamaño, "son memorias cache". Su tamaño depende de la arquitectura del procesador y de si el mismo de de 64, 32, 16 u 8bits. Estas memorias especiales las llamamos "registros". Si nuestra CPU es de `32bits`, nosotros no dispondremos de registros de `64bits` obivamente, pero si podremos hacer uso de estos para hacer divisiones de registros, es decir, si nuestro registro mas grande es de `32bits`, podemos dividirlo y tener dos registros de `16bits`, a su vez, uno de estos registros de `16bits` podemos partirlos en 2 registro de `8bits`. Tal vez te preguntes por que alguien querria hacer esto, la respuesta es mas simple de lo que parece y es por temas de compatibilidad. Imaginense que tienen una CPU de `64bits` con sus correspondientes registro de 64 y queremos correr programa de `32bits`, lo que podemos hacer es "dividir" esos registros de `64bits` para obetener los de `32bits`, aunque la otra mitad no se usaran para nada. Este sistema nos permite tener una compatibilidad para ejecutar programas de 64, 32, 16 u 8bits siempre y cuando podamos hacer las divisiones necesarias. 
Aunque no siempre es por esto, otras veces simplemente querremos optimizar nuestro codigo, y tal vez un registro de `64bits` sea demasiado grande para lo que queremos.

----
### Aqui tenemos los registros de 64, 32, 16 y bits:
![x86-registros](../Imagenes/x86-registers.png)

Para nosotros, los registros mas importantes seran por ahora los de tipo `a`, `b`, `c`, `d`, `sp` y `bp` de 8, 16, 32 y 64bits

|Nombre del registro| Tamaño |
|:-----------------:|:------:|
|`ah`               |`8 bit` |
|`al`               |`8 bit` |
|`bh`               |`8 bit` |
|`bl`               |`8 bit` |
|`ch`               |`8 bit` |
|`cl`               |`8 bit` |
|`dh`               |`8 bit` |
|`dl`               |`8 bit` |
|`bpl`              |`8 bit` |
|`spl`              |`8 bit` |
|`ax`               |`16 bit`|
|`bx`               |`16 bit`|
|`cx`               |`16 bit`|
|`dx`               |`16 bit`|
|`bp`               |`16 bit`|
|`sp`               |`16 bit`|
|`eax`              |`32 bit`|
|`ebx`              |`32 bit`|
|`ecx`              |`32 bit`|
|`edx`              |`32 bit`|
|`ebp`              |`32 bit`|
|`esp`              |`32 bit`|
|`rax`              |`64 bit`|
|`rbx`              |`64 bit`|
|`rcx`              |`64 bit`|
|`rdx`              |`64 bit`|
|`rsp`              |`64 bit`|
|`rbp`              |`64 bit`|
----
### - Registros de tipo A:
En realidad creo que nadie los llama asi, pero bueno, para entendernos llamaremos a los registros `rax`, `eax`, `ax`, `ah`, `al` de tip A, ya que todos estos cumplen en teoria una misma funcion. Normalmente, con estos registros se escoje el servicio a usar, por asi decir, es el registro que usaremos normalmente para realizar la ejecucion de una funcion del sistema o etc, es decir, supongamos que queremos imprimir algo por pantalla en un sistema linux. Normalmente para esta tarea usamos lo que llamamos una "interrupcion", lo cual explicaremos mas adelante lo que es. La interupcion que se usa en linux para esto es la `80h` que es lo mismo que `0x80` en hexadecimal, donde tenemos que poner en el registro `eax` por ejemplo, el valor 4, para especificar que queremos usar `sys_write`, que traducido a español, es la llamada para escritura, luego se usan los demas registros para especificar que hacer esactamente, pero eso ahora no importa. Otro ejemplo seria poner en el registro `ah` el valor de `0x00` y hacer una interupcion (`10h` == `0x10`), con esto hacemos una interupcion al BIOS para decirle que queremos cambiar el modo de bideo. Tal vez te preguntes como saber que valor poner en este registro para realizar una tarea en especifico, para eso, depende de si quieres hacer una interrupcion ("hablar") con el BIOS, con el sistema o etc. El BIOS tiene la interupcion 10h, linux la 80h, el DOS la 21H y asi, sabiendo que interupcion queremos realizar, podemos buscar en internet por ejemplo la "tabla de servicios" de la interupcion que deseamos, y en esta nos especificaran los distintos servicios, valores de configuracion y utilidad de estas. 
|Para entendernos|Como realmente se llaman|
|:----:|:----:|
|`a64` | `rax`|
|`a32` | `eax`|
|`a16` |  `ax`|
|`a8l` |  `ah`|
|`a8h` |  `al`|

Este registro tambien se caracteriza por llamarse `registro acumulador` y se usa tambien para realizar operaciones aritmeticas aparte de las operaciones de `E/S` ya mencionadas.

----

### - Registros de tipo B:
Estos son los registros `rbx`, `ebx`, `bx`, `bh`, `bl` y los estaremos llamando de tipo B por simplicidad. `rbx` sera nuestro registro B de `64bits ` `b64`. El registro `b32` sera el `ebx` que es el registro de tipo B de `32bits`. EL registro B de 16 bits o `b16` sera `bx` y aqui ahora tenemos un conflicto de nombres ya que ambos son de `8bits`. Para este caso los llamaremos tal cual pero sustitullendo la `b` por `b8` delante del nombre de cada registro, ya explicare mas tarde el por que. `b8l` = `bh` y `b8l` = `bl`. No es necesario que los llames en `b64`, `b32`, `b16`, `b8h` o `b8l` ya que nadie los llama asi y realmente se llaman como se digo en primera instancia, pero volvemos a que es por simplificar, ya qye con el `b` sabemos que hablamos de los registros de tipo B, con el `32` sabemos que hablamos del de `32bis`, es decir, de `ebx`.
|Para entendernos|Como realmente se llaman|
|:----:|:----:|
|`b64` | `rbx`|
|`b32` | `ebx`|
|`b16` |  `bx`|
|`b8l` |  `bh`|
|`b8h` |  `bl`|

Tambien llamado `registo base`. Los registros B son los unicos de proposito general que se puede usar como indice en el direccionamiento indexado. Tambien se suele usar para realizar calculos aritmeticos.

----

### - Registros de tipo C:
Estos son los registros `rcx`, `ecx`, `cx`, `ch`, `cl` y tambien los estaremos llamando de tipo C. 
|Para entendernos|Como realmente se llaman|
|:----:|:----:|
|`c64` | `rcx`|
|`c32` | `ecx`|
|`c16` |  `cx`|
|`c8l` |  `ch`|
|`c8h` |  `cl`|

Tambien conocido como `registro contador`, se suele usar para contener la cantidad de veces que se quiere repetir una operacion.

----

### - Registros de tipo D:
Estos son los registros `rdx`, `edx`, `dx`, `dh`, `dl` por ultimo, estos son los de tipo D.
|Para entendernos|Como realmente se llaman|
|:----:|:----:|
|`d64` | `rdx`|
|`d32` | `edx`|
|`d16` |  `dx`|
|`d8l` |  `dh`|
|`d8h` |  `dl`|

Estos son conocidos tambien como `registro de datos`. Algunas operaciones de `E/S` (Entrada / Salida) necesitan hacer uso de este. Tambien se utiliza para realizar las operaciones de multiplicacion y division con cifras granes.

----

### Curiosidades sobre los registros a tener en cuenta.
Primero decir por que los registros reales, tiene en su nombre una `l`, o una `h` en el caso de los de `8bits`, o por que los registros de 16, 32 y 64bits lleban una `x`. Empezaremos explicando por que llevan una `x`, esta se debe a que los registros de 16, 32 y 64bits son registros "extendidos", por lo que la `x` viene de `extend` ya que originalmente, los primeros procesadores de este tipo eran de `8bits`. Cuando avanzo la tecnologia y se crearon los registros de `16bits`, se llamaron a los nuevos registros, `ax`, `bx`, `cx` y `dx` ya que eran los registros extendidos de `al` y `ah` en el caso de `ax`, y lo mismo con los registros `bx`, `cx` y `dx`, por lo que:
|registros combinados|registro resultante|
|:---------:|:----:|
|`ah` + `al`| `ax` |
|`bh` + `bl`| `bx` |
|`ch` + `cl`| `cx` |
|`dh` + `dl`| `dx` |

Esto es asi ya que los registros de `16bits` y superiores se componen de lo que llamamos una parte alta (`hight = h`) de ahi la `h` de los registros `ah`, `bh`, `ch`, `dh` y una parte baja (`low = l`). De ahi la `l` de los registro de `8bits`, `al`, `bl`, `cl`, `dl`. 
Nuestro registro `bx` entonces esta formado por su parte alta `bh` y su parte baja `bl`. Por lo que si ponemos el byte `0xff` en `bl` y el byte `0xaa` en el registro `bh`, el valor del registro `bx`, es `0xaaff`. 
Ya que en nuestro registro de `16 bits`, la parte alta es el `byte` de la izquierda y la parte baja, el `byte` de la derecha. Siendo `bh` un `word`, que es lo mismo que un valor de `16 bits` o `2 bytes` en este caso.



```mermaid 
flowchart TB
    subgraph RRX
        subgraph ERX
            direction RL
            subgraph RX
                direction RL
                RL o--o RH
            end
            subgraph NULL
                direction RL
                id1(16bits_Sin_Uso)
            end
            RX o--o NULL
        end
        subgraph NULL.
            direction RL
            id2(32bits_Sin_Uso)
        end
        NULL. o--o ERX
    end
    style id1 fill:#00b3ff,stroke:#087717,stroke-width:4px
    style id2 fill:#00b3ff,stroke:#087717,stroke-width:6px
```
|cabe mencionar que en este diagrama, la letra 'R' se sustituye por la letra del tipo de registro que usted quiera.|
|:----:|


Siguiendo esta logica, la parte baja del registro `eax` es `ax` y la parte baja de `rax` es `eax`. Como puedes ver en el diagrama anterior, las partes altas de los registros `eax` y `rax` no tienen un acesso directo a ellos.

Originalmente, en los procesadores `8086` podemos encontrar los 14 registros de `16bits`.
Al Byte de la izquierda de `ax`, que es identificado por `ah`, es tambien llamado `byte de orden alto  o byte mas significativo`, mientras que a `al` se le llama el `byte de orden bajo o byte menos significativo.`

Los registros de tipo `a`, `b`, `c`, `d` son llamados `registros de proposito general`. Tambien tenemos `registros de banderas`, `registros de segmento`, `registros de apuntadores o de puntero`, `registros indice` y `registros de proposito general extendido`. Los `registros de proposito general` suelen usarse para almacenar los datos con los que se va a realizar una operacion en el programa.

Si no me equivoco, la letra `e` de los registros de `32bits` hace referencia a `extend = extendido` y la letra `r` de los registros de `64bits` hace referencia a `re-extend = re-extendidos`.

----

### Registros indice: registro Fuente(SI) y registro Destino(DI).
La letra `s` hace referencia a `source = fuente` y la letra `d` a `destiny = destino`. De los registros fuentes podemos encontrar su version de 8, 16, 32 y 64 bits, conocidos como `sil`, `si`, `esi` y `rsi`. Y para los registros de destino ta,bien podemos encontrar su version de 8, 16, 32 y 64 bits, conocidos como `dil`, `di`, `edi` y `rdi`. Estos registros se usan para manejar arrays y cadenas(`strings`) principalmente.

----

### Registros Puntero: puntero Base(BP), puntero Pila(SP) y puntero de instruciones(IP):

Estos registros guardara direciones de memoria.

#### Registros BP y SP:
Estos registros trabajan de la la mano y se asocian al registro de segmento `ss`. Estos registros se usan en conjunto para manipular el `stack`, tambien conocido como pila. `bp` viene de `Base Pointer` que es lo mismo que `Puntero Base` y `sp` proviene de `Stack Pointer` o `Puntero Stack`. Podeis encontrar mas informacion de estos registros y del uso de la pila en este apartado:

- [Registros BP, SP y la pila.](./sp-bp-pila.md)

Debemos mencionar, que al igual que los registro de tipo `A, B`, `C` y `D`, estos tambien tienen sus versiones en distintos tamaños y colores. Siendo `bpl`, `bp`, `ebp`, `rbp`, las correspondientes versiones de los registros de 8, 16, 32 y 64bits del `Base Pointer`. Y en el caso del `Stack Pointer`, sus registros son `spl`, `sp`, `esp`, `rsp`, siendo de 8, 16, 32 y 64bits. Los registros `sp` y `bo` tambien son conocidos como registros apuntadores, ya que apuntan normalmente a una direcion de memoria.

#### Registro Puntero de Instrucion(IP)
Tambien conocido como `instruction pointer`, este registro tiene almacenado la direcion de memoria de la instrucion a ejecutar. Este registro es actualizado de forma automatica por el procesador tras la ejecucion de cada instrucion. Este registro trabaja junto al registro `cs`. En `cs` se especifica la direcion de segmento de codigo y `ip` contiene el desplazamiento dentro del segmento de codigo.
Si `cs` tiene un valor hexadecimal de `0x1234` y el registro `ip` tiene un valor de `0x0012`, la direcion de la siguiente instrucion a ejecutar es la suma del registro `cs` y del registro `ip`. `cs` + `ip` = `0x1234` + `0x0012` = `0x1246`. La direcion de la siguiente instrucion a ejecutar es `0x1246`.
El procesador aumenta el valor del registro `ip` acorde al tamaño de la instrucion anterior, si la instrucion anterior ocupaba `3bytes`, el nuevo valor de `ip` es el valor antiguo mas 3.
De este registro, el `ip`, tambien exite sus versiones de 8, 16, 32 y 64 bits, conocidos como `ipl`, `ip`, `eip` y `rip`. No estoy seguro de la existencia del registro `ipl` pero lo incluyo por si acaso y a ver si usted es capaz de encontar algo acerca de el.
Como programadores, nosotros no podemos alterar el registro `ip` de forma directa, sino con instruciones especificas como `jmp` o `call`.

----

### Los registros de proposito general extendido.

Estos registros solo los encontraremos en procesadores de `64bits`. Se usan para escribir y leer datos que podemos almacenar, tal como hariamos con `variables`. Existe 8 de estos registros y solo en procesadores de `64bits`. Tambien tienen sus versiones de 8, 16, 32 y 64bits. De estos registros, los de `64bits` se llaman `r8`, `r9`, `r10`, `r11`, `r12`, `r13`, `r14` y `r15`. De los de `32bits` encontramos `r8d`, `r9d`, `r10d`, `r11d`, `r12d`, `r13d`, `r14d`. De los de `16bits` encontramos `r8w`, `r9w`, `r10w`, `r11w`, `r12w`, `r13w`, `r14w`.De los de `8bits` encontramos `r8b`, `r9b`, `r10b`, `r11b`, `r12b`, `r13b`, `r14b`.

12:45
| `64bits` |  `32bits` |  `16bits` |  ` 8bits` |
|:--------:|:---------:|:---------:|:---------:|
|   `r8`   |   `r8d`   |   `r8w`   |   `r8b`   |
|   `r9`   |   `r9d`   |   `r9w`   |   `r9b`   |
|   `r10`  |   `r10d`  |   `r10w`  |   `r10b`  |
|   `r11`  |   `r11d`  |   `r11w`  |   `r11b`  |
|   `r12`  |   `r12d`  |   `r12w`  |   `r12b`  |
|   `r13`  |   `r13d`  |   `r13w`  |   `r13b`  |
|   `r14`  |   `r14d`  |   `r14w`  |   `r14b`  |
|   `r15`  |   `r15d`  |   `r15w`  |   `r15b`  |
