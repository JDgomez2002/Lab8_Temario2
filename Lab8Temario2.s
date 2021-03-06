/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Org de computadoras y Assembler
* Ciclo 1 - 2022
* Gonzalo Santizo
* Jose Daniel Gomez
* Melanie Maldonado
 ----------------------------------------------- */

@ ---------------------------------------
@	Data Section
@ ---------------------------------------
	 .data
	 .balign 4	
bienvenida: 	 .asciz  "\nBienvenido al corrimiento de bits inactivos!!! Temario 2\n"
ErrMsg:	 .asciz	"Wrong data closing now...\n"
pin0:	 .int	0
pin1:	 .int	1
pin2:	 .int	2
pin3:	 .int	3
pin4:	 .int	4
pin5:	 .int	5
pin6:	 .int	6
pin7:	 .int	7

i:	 	 .int	0
delayMs: .int	500
OUTPUT	 =	1

@ ---------------------------------------
@	Code Section
@ ---------------------------------------

.text
.global main
.extern printf
.extern wiringPiSetup
.extern delay
.extern digitalWrite
.extern pinMode

main:   push    {ip, lr}
    bl wiringPiSetup
    mov r1,#-1 @@Detector de error
    cmp r0, r1
    bne init @@inicia si no hay error
    ldr r0, = ErrMsg @@si hay error imprime y sale con done
    bl printf
    b done

@setear pin
init:
	ldr r0, = bienvenida
    bl printf
    @WiringPi 0
    ldr r0, = pin0
    ldr r0, [r0]
    mov r1, #OUTPUT
    bl pinMode

    @WiringPi 1
    ldr r0, = pin1
    ldr r0, [r0]
    mov r1, #OUTPUT
    bl pinMode

    @WiringPi 2
    ldr r0, = pin2
    ldr r0, [r0]
    mov r1, #OUTPUT
    bl pinMode

    @WiringPi 3
    ldr r0, = pin3
    ldr r0, [r0]
    mov r1, #OUTPUT
    bl pinMode

    @WiringPi 4
    ldr r0, = pin4
    ldr r0, [r0]
    mov r1, #OUTPUT
    bl pinMode

    @WiringPi 5
    ldr r0, = pin5
    ldr r0, [r0]
    mov r1, #OUTPUT
    bl pinMode

    @WiringPi 6 
    ldr r0, = pin6
    ldr r0, [r0]
    mov r1, #OUTPUT
    bl pinMode

    @WiringPi 7
    ldr r0, = pin7
    ldr r0, [r0]
    mov r1, #OUTPUT
    bl pinMode

ldr r4, = i
ldr r4, [r4]
mov r5, #10

forLoop:
    cmp r4, r5
    bgt done

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 1 --------------------------------------------
@---------------------------------------****-------------------------------------------------    

estado1:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @WIRINGPI PIN 0
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY OFF 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    b estado2

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 2 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado2:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @WIRINGPI PIN 0
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY OFF 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    b estado3

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 3 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado3:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @WIRINGPI PIN 0
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY OFF 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    b estado4

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 4 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado4:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @WIRINGPI PIN 0
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY OFF 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 5 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado5:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @WIRINGPI PIN 0
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY OFF 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    b estado6

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 6 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado6:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @WIRINGPI PIN 0
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY OFF 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    b estado7

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 7 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado7:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @WIRINGPI PIN 0
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY OFF 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    b estado8

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 8 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado8:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @WIRINGPI PIN 0
	ldr	r0, = pin0				// carga direcci??n de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY OFF 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    add	r4, #1					// incrementa contador
	b	forLoop					// repite ciclo

done:
        pop {ip, pc}
