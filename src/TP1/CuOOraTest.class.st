Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'topicos',
		'usuario',
		'usuario2',
		'topic',
		'topic3'
	],
	#category : #'TP1-tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
cuoora := CuOOra new.
topicos := Set new. 
topic := Topico newConNombre: 'POO' descripcion:'Descripcion de lo que es la POO'.
topic3 := Topico newConNombre: 'P funcional' descripcion: 'Para aquellas preguntas sobre p funcional'.
usuario := Usuario newConNombreDeUsuario: 'mati' contraseña: '123'.
topicos add: topic. 
usuario2 := Usuario newConNombreDeUsuario: 'tina' contraseña: '456'.
]

{ #category : #tests }
CuOOraTest >> testAgregarTopicoConNombreDescripcion [

|topico|

self assert: cuoora topicos isEmpty.
topico := cuoora agregarTopicoConNombre: 'Tecnologia' descripcion: 'Aqui van las preguntas de tecnologia'.
self assert: (cuoora topicos anySatisfy: [:each | each = topico]).
cuoora borrarTopico: topico.
self deny: (cuoora topicos anySatisfy: [:each | each = topico]).

]

{ #category : #tests }
CuOOraTest >> testAgregarTopicos [

cuoora agregarTopicos: topicos.
self assert: (cuoora topicos contains: [:each | each = topic]).
self deny: (cuoora topicos contains: [:each | each = (Topico newConNombre: 'el nuevo topico' descripcion: 'el nuevo topico es este')])
]

{ #category : #tests }
CuOOraTest >> testAgregarUsuarioConNombreContraseña [

self assert: (cuoora usuarios isEmpty).
cuoora agregarUsuario: usuario. 
self assert: (cuoora usuarios anySatisfy: [:each | each = usuario]).
cuoora borrarUsuario: usuario.
self deny: (cuoora usuarios anySatisfy: [:each | each = usuario]).
self assert: cuoora usuarios isEmpty.

]

{ #category : #tests }
CuOOraTest >> testCalcularPuntajeDe [

|puntaje pregunta|

cuoora agregarUsuario: usuario.
cuoora agregarUsuario: usuario2.


puntaje := cuoora calcularPuntajeDe: usuario.
self assert: puntaje equals: 0.

pregunta := usuario agregarPreguntaConTitulo: 'es un test' descripcion: 'solo un test' topicos: nil. 
puntaje := cuoora calcularPuntajeDe: usuario.
self assert: puntaje equals: 20.
pregunta agregarRespuestaConUsuario: usuario texto: 'Es una respuesta'.
puntaje := cuoora calcularPuntajeDe: usuario.
self assert: puntaje equals: 70.

pregunta agregarLikeDe: usuario2.
puntaje := cuoora calcularPuntajeDe: usuario.
self assert: puntaje equals: 71.

pregunta:= usuario2 agregarPreguntaConTitulo: 'mati' descripcion: 'un test de preguntas' topicos: nil.
pregunta agregarRespuestaConUsuario: usuario texto: 'es una respuesta de prueba'.
puntaje := cuoora calcularPuntajeDe: usuario.
self assert: puntaje equals: 121.


]

{ #category : #tests }
CuOOraTest >> testChequearExistenciaDeUsuarioConNombreContraseña [

cuoora agregarUsuario: usuario.
self assert: ((cuoora chequearExistenciaDeUsuarioConNombre: 'mati' contraseña: '123') isNotNil).
self assert: ((cuoora chequearExistenciaDeUsuarioConNombre: 'tina' contraseña: '456' )isNil).
]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasDeTopico [
|pregunta |
pregunta :=  usuario agregarPreguntaConTitulo: '¿Que es xUnit?' descripcion: 'Me gustaria saber mas del tema' topicos: topicos.
self assert: (usuario preguntas anySatisfy: [:each | each topicos contains: [:a | a = topic]]).
self deny: (usuario preguntas anySatisfy: [:each | each topicos contains: [:a | a = (topic3)]])
]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasRelevantesDe [

|user1 user2 user3 user4 topics topic1 topic2 preguntas topics2 preg preg2|

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
preg := user2 agregarPreguntaConTitulo: 'sd' descripcion: 'es mi propia pregunta' topicos: topics.
user3 agregarPreguntaConTitulo: 'Esta no pasa' descripcion: 'Esta no debe pasar' topicos: topics2.
preg2 :=  user4 agregarPreguntaConTitulo: 'Esta pasa ' descripcion: 'Esa si que pasa' topicos: topics2.

user2 seguirA: user1.
user2 seguirA: user4.
user2 agregarTopicoDeInteres: topic1.

preguntas:= cuoora obtenerPreguntasRelevantesDe: user2.

self assert: preguntas size equals: 5.
self assert: (preguntas contains: [:each | each = preg]).

user4 agregarTopicoDeInteres: topic2.
user4 seguirA: user1.
user4 seguirA: user3.
preguntas:= cuoora obtenerPreguntasRelevantesDe: user4.
self assert: preguntas size equals: 5.
self assert: (preguntas contains: [:each | each = preg2]).
self deny: (preguntas contains:[:each | each = preg]).



]

{ #category : #tests }
CuOOraTest >> testObtenerRespuestasDe [

|user question respuestas response|

user:= cuoora agregarUsuarioConNombre: 'mati' contraseña: '1234'.

question:= user agregarPreguntaConTitulo: 'POO' descripcion: 'Que es la POO' topicos: topicos.
self assert: question respuestas isEmpty. 

respuestas := cuoora obtenerRespuestasDe: user.
self assert: respuestas size equals: 0.

response :=  question agregarRespuestaConUsuario: user texto: 'Es un paradigma de programacion'.
self assert: question respuestas size equals: 1.
self assert: (question respuestas contains: [:each | each = response]).
respuestas := cuoora obtenerRespuestasDe: user.
self assert: respuestas size equals: 1.

]
