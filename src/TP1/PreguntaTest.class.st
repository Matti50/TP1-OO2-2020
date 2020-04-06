Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'user',
		'topico'
	],
	#category : #'TP1-tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	|topicos|
topicos := Set new.
topico := Topico newConNombre: 'soySolo topico' descripcion: 'test'.
topicos add: topico.
pregunta := Pregunta newConUsuario: (Usuario newConNombreDeUsuario: 'mati' contraseña: '123') titulo: 'just a question' descripcion: 'quest' topicos: topicos.
user := Usuario newConNombreDeUsuario: 'mati' contraseña: '123'.
]

{ #category : #tests }
PreguntaTest >> testAgregarRespuestaConUsuarioTexto [

self assert: pregunta respuestas isEmpty.

pregunta agregarRespuestaConUsuario: (Usuario newConNombreDeUsuario: 'mati' contraseña: '123') texto: 'esta es la respuesta'.

self assert: pregunta respuestas size equals: 1.
]

{ #category : #tests }
PreguntaTest >> testObtenerRespuestasDe [

self assert: (pregunta obtenerRespuestasDe: user) isEmpty.

pregunta agregarRespuestaConUsuario: user texto: 'es una respuesta'.

self assert: (pregunta obtenerRespuestasDe: user) size equals: 1.
]

{ #category : #tests }
PreguntaTest >> testRespuestasOrdenadas [

|respuesta1 respuesta2 respuestas |

respuesta1 :=  pregunta agregarRespuestaConUsuario: user texto: '1234'. 
respuesta2 :=  pregunta agregarRespuestaConUsuario: user texto: '1234'.

respuesta1 agregarLikeDe: user.

respuestas := pregunta respuestasOrdenadas.

self assert: respuestas first equals: respuesta1.

respuesta1 agregarDislikeDe: user.

respuestas := pregunta respuestasOrdenadas.

self assert: respuestas first equals: respuesta2.
]

{ #category : #tests }
PreguntaTest >> testSoyDeTopico [

|testTopic|
testTopic := Topico newConNombre: 'Another test topic' descripcion: 'My title says it all'.
self assert: (pregunta soyDeTopico: topico).
self deny: (pregunta soyDeTopico: testTopic).

]
