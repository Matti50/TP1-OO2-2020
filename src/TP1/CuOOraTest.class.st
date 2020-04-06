Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'topicos',
		'usuario',
		'usuario2'
	],
	#category : #'TP1-tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
cuoora := CuOOra new.
topicos := Set new. 
usuario := Usuario newConNombreDeUsuario: 'mati' contraseña: '123'.
topicos add: (Topico newConNombre: 'POO' descripcion:'Descripcion de lo que es la POO'). 
usuario2 := Usuario newConNombreDeUsuario: 'tina' contraseña: '456'.
]

{ #category : #tests }
CuOOraTest >> testAgregarTopicoConNombreDescripcion [

|topico|

self assert: cuoora topicos isEmpty.
topico := cuoora agregarTopicoConNombre: 'Tecnologia' descripcion: 'Aqui van las preguntas de tecnologia'.
self assert: cuoora topicos size equals: 1.
cuoora borrarTopico: topico.
self assert: cuoora topicos isEmpty.

]

{ #category : #tests }
CuOOraTest >> testAgregarUsuarioConNombreContraseña [
|usuario|

self assert: (cuoora usuarios isEmpty).
usuario :=  cuoora agregarUsuarioConNombre: 'mati' contraseña: '123'.
self assert: cuoora usuarios size equals: 1.
cuoora borrarUsuario: usuario.
self assert: cuoora usuarios isEmpty.

]

{ #category : #tests }
CuOOraTest >> testBorrarPregunta [

|usuario pregunta|
usuario := cuoora agregarUsuarioConNombre: 'mati' contraseña: '123'.
self assert: usuario preguntas size equals: 0.

pregunta :=  usuario agregarPreguntaConTitulo: '¿Que es la POO?' descripcion: 'Hola, me gustaria saber mas del tema' topicos: topicos.
self assert: usuario preguntas size equals: 1.

cuoora borrarPregunta: pregunta.
self assert: usuario preguntas size equals: 0. 
]

{ #category : #tests }
CuOOraTest >> testCalcularPuntajeDe [

|user user2 puntaje pregunta|

user := cuoora agregarUsuarioConNombre: 'mati' contraseña: '123'.
user2 := cuoora agregarUsuarioConNombre: 'agus' contraseña: '456'.


puntaje := cuoora calcularPuntajeDe: user.
self assert: puntaje equals: 0.

pregunta := user agregarPreguntaConTitulo: 'es un test' descripcion: 'solo un test' topicos: nil. 
puntaje := cuoora calcularPuntajeDe: user.
self assert: puntaje equals: 20.
pregunta agregarRespuestaConUsuario: user texto: 'Es una respuesta'.
puntaje := cuoora calcularPuntajeDe: user.
self assert: puntaje equals: 70.

pregunta agregarLikeDe: user2.
puntaje := cuoora calcularPuntajeDe: user.
self assert: puntaje equals: 71.

pregunta:= user2 agregarPreguntaConTitulo: 'mati' descripcion: 'un test de preguntas' topicos: nil.
pregunta agregarRespuestaConUsuario: user texto: 'es una respuesta de prueba'.
puntaje := cuoora calcularPuntajeDe: user.
self assert: puntaje equals: 121.


]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasDe [
|preguntas|
preguntas:= cuoora obtenerPreguntasDe: usuario.
self assert: preguntas size equals: 0.

usuario agregarPreguntaConTitulo: 'sd' descripcion: 'sd' topicos: nil.
preguntas := cuoora obtenerPreguntasDe: usuario.
self assert: preguntas size equals: 1. 
]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasDeTopico [

|usuario3 preguntas topicos2 topico1 topico2 pregunta|

topicos2 := OrderedCollection new.

topico1:= topicos2 add: (Topico newConNombre: 'POO' descripcion: 'Poo').
topico2 := topicos2 add: (Topico newConNombre: 'P. Estructurada' descripcion: 'estructurada').

usuario3 := cuoora agregarUsuarioConNombre: 'mati' contraseña: '23'.

usuario3 agregarPreguntaConTitulo: 'Nueva pregunta' descripcion: 'es una nueva pregunta' topicos: topicos2.

preguntas := cuoora obtenerPreguntasDeTopico: topico1.
self assert: preguntas size equals: 1.
preguntas := cuoora obtenerPreguntasDeTopico: topico2.
self assert: preguntas size equals: 1.

pregunta :=  usuario3 agregarPreguntaConTitulo: 'Nueva pregunta 2' descripcion: 'es otra pregunta' topicos: topicos2.
preguntas := cuoora obtenerPreguntasDeTopico: topico1.
self assert: preguntas size equals: 2.
preguntas := cuoora obtenerPreguntasDeTopico: topico2. 
self assert: preguntas size equals: 2.

cuoora borrarPregunta: pregunta.
preguntas := cuoora obtenerPreguntasDeTopico: topico1.
self assert: preguntas size equals: 1.
]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasRelevantesDe [

|user1 user2 user3 user4 topics topic1 topic2 preguntas topics2|

topics2 := Set new.
topics := Set new.
topic1 := Topico newConNombre: 'Topico1' descripcion: 'Un topico de prueba'.
topics add: topic1.
topic2 := Topico newConNombre: 'Topico2' descripcion: 'Another test topic'.
topics2 add: topic2.

user1 := cuoora agregarUsuarioConNombre: 'mati' contraseña: '123'.
user2:= cuoora agregarUsuarioConNombre: 'Agus' contraseña: '345'.
user3 := cuoora agregarUsuarioConNombre: 'tino' contraseña: '789'.
user4 := cuoora agregarUsuarioConNombre: 'Augusto Cesar' contraseña: 'Roma'.

user1 agregarPreguntaConTitulo: 'test' descripcion: 'test' topicos: topics.
user3 agregarPreguntaConTitulo: 'sd' descripcion: 'sdsd' topicos: topics.
user1 agregarPreguntaConTitulo: 'sd' descripcion: 'hola a todos' topicos: topics2.
user2 agregarPreguntaConTitulo: 'sd' descripcion: 'es mi propia pregunta' topicos: topics.
user3 agregarPreguntaConTitulo: 'Esta no pasa' descripcion: 'Esta no debe pasar' topicos: topics2.
user4 agregarPreguntaConTitulo: 'Esta pasa ' descripcion: 'Esa si que pasa' topicos: topics2.

user2 seguirA: user1.
user2 seguirA: user4.
user2 agregarTopicoDeInteres: topic1.

preguntas:= cuoora obtenerPreguntasRelevantesDe: user2.

self assert: preguntas size equals: 5.

user4 agregarTopicoDeInteres: topic2.
user4 seguirA: user1.
user4 seguirA: user3.
preguntas:= cuoora obtenerPreguntasRelevantesDe: user4.
self assert: preguntas size equals: 5.



]

{ #category : #tests }
CuOOraTest >> testObtenerRespuestasDe [

|user question respuestas|

user:= cuoora agregarUsuarioConNombre: 'mati' contraseña: '1234'.

question:= user agregarPreguntaConTitulo: 'POO' descripcion: 'Que es la POO' topicos: topicos.
self assert: question respuestas isEmpty. 

respuestas := cuoora obtenerRespuestasDe: user.
self assert: respuestas size equals: 0.

question agregarRespuestaConUsuario: user texto: 'Es un paradigma de programacion'.
self assert: question respuestas size equals: 1.

respuestas := cuoora obtenerRespuestasDe: user.
self assert: respuestas size equals: 1.

]

{ #category : #tests }
CuOOraTest >> testObtenerRespuestasOrdenadasDe [

|pregunta respuestas respuesta1 respuesta2|

pregunta := usuario agregarPreguntaConTitulo: 'POO' descripcion: 'Paradigma' topicos: topicos.

respuesta1 := pregunta agregarRespuestaConUsuario: usuario texto: 'Si, es un paradigma'.
respuesta2 := pregunta agregarRespuestaConUsuario: usuario texto: 'Es distinto que estructurada'.
self assert: pregunta respuestas size equals: 2.

respuesta1 agregarLikeDe: usuario.
respuesta2 agregarLikeDe: usuario.
respuesta2 agregarLikeDe: usuario2.

self assert: respuesta2 likes size equals: 2.
self assert: respuesta1 likes size equals: 1.

respuestas := cuoora obtenerRespuestasOrdenadasDe: pregunta.
self assert: respuestas first equals: respuesta2.

respuesta1 agregarDislikeDe: usuario.
self assert: respuesta1 likes size equals: 0.
self assert: respuesta1 dislikes size equals: 1.

respuesta2 agregarDislikeDe: usuario.
respuesta2 agregarDislikeDe: usuario2.
self assert: respuesta2 dislikes size equals: 2.

respuestas := cuoora obtenerRespuestasOrdenadasDe: pregunta.
self assert: respuestas first equals: respuesta1.


]
