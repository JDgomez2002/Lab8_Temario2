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
ErrMsg:	 .asciz	"\n\tError: Ingrese 'y' o 'q'....\n"
SolicitarOpcion: .asciz	"\nIngrese  'y' para cambiar de estado o 'q' para finalizar el programa\n>>>"
SolicitarOrientacion: .asciz "\nCambie el estado del DipSwitch para cambiar la orientacion del corrimiento de bits inactivos...\n"
pin0:	 .int	0
pin1:	 .int	1
pin2:	 .int	2
pin3:	 .int	3
pin4:	 .int	4
pin5:	 .int	5
pin6:	 .int	6
pin7:	 .int	7
pin8:	 .int	10

i:	 	 .int	0
delayMs: .int	500
delayMs2: .int	100
OUTPUT	 =	1
INPUT	 =	0

opcionFormato: .asciz " %c"
comando: .byte 0

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

	@WiringPi 8
    ldr r0, = pin8
    ldr r0, [r0]
    mov r1, #INPUT
    bl pinMode

ldr r4, = i
ldr r4, [r4]
mov r5, #2

forLoop:
    cmp r4, r5
    bgt done

	ldr r0,=SolicitarOrientacion
	bl puts

	@WIRINGPI PIN 8	
	ldr	r0, = pin8				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	bl 	digitalRead				// funcion para llamar a leer
	cmp r0,#0
	beq estado1
	bne estado1Reverse

	LoopRepetition:
		add	r4, #1					// incrementa contador
		b	forLoop					// repite ciclo

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 1 --------------------------------------------
@---------------------------------------****-------------------------------------------------    

estado1:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

	@---------
	try2:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado2
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try2
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 2 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado2:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay
	
    @---------
	try3:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado3
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try3
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 3 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado3:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @---------
	try4:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado4
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try4
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 4 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado4:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

	@---------
	try5:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado5
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try5
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 5 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado5:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @---------
	try6:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado6
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try6
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 6 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado6:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @---------
	try7:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado7
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try7
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 7 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado7:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @---------
	try8:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado8
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try8
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 8 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado8:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

	b try9

@---------
	try9:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq LoopRepetition
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try9
	@---------


@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 1 REVERSE --------------------------------------------
@---------------------------------------****-------------------------------------------------    

estado1Reverse:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

	@---------
	try2R:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado2Reverse
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try2R
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 2 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado2Reverse:
    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay
	
    @---------
	try3R:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado3Reverse
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try3R
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 3 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado3Reverse:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @---------
	try4R:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado4Reverse
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try4R
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 4 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado4Reverse:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

	@---------
	try5R:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado5Reverse
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try5R
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 5 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado5Reverse:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @---------
	try6R:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado6Reverse
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try6R
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 6 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado6Reverse:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @---------
	try7R:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado7Reverse
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try7R
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 7 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado7Reverse:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

    @---------
	try8R:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq estado8Reverse
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try8R
	@---------

@---------------------------------------****-------------------------------------------------    
@------------------------------------   ESTADO 8 --------------------------------------------
@---------------------------------------****------------------------------------------------- 

estado8Reverse:

    @WIRINGPI PIN 0	
	ldr	r0, = pin0				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 1
	ldr	r0, = pin1				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 2
	ldr	r0, = pin2				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 3
	ldr	r0, = pin3				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 4
	ldr	r0, = pin4				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 5
	ldr	r0, = pin5				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 6
	ldr	r0, = pin6				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @WIRINGPI PIN 7
	ldr	r0, = pin7				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite			// escribe 1 en pin para activar puerto GPIO

    @---------------------------------------------
    @DELAY ON 
    @---------------------------------------------
	ldr	r0, =delayMs
	ldr	r0, [r0]
	bl	delay

	b try9

@---------
	try9R:

	@Delay para cada 0.8 segundos
	ldr	r0, = delayMs2
	ldr	r0, [r0]
	bl	delay

	ldr r0,=SolicitarOpcion
	bl puts

	ldr r0,=opcionFormato
	ldr r1,=comando
	bl scanf

	ldr r8,=comando
	ldrb r8,[r8]
	cmp r8,#'y'
	beq LoopRepetition
	cmpne r8,#'q'
	beq done
	
	ldr r0,=ErrMsg
	bl puts
	b try9R
	@---------

done:
        pop {ip, pc}
