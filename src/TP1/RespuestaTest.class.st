Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'respuesta',
		'usuario',
		'pregunta'
	],
	#category : #'TP1-tests'
}

{ #category : #running }
RespuestaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
usuario := Usuario newConNombreDeUsuario: 'mati' contraseña: '123'.
pregunta := Pregunta newConUsuario: usuario titulo: 'a question' descripcion: 'a simple question' topicos: 
(Set new add: (Topico newConNombre: 'Un topic' descripcion: 'just a topic')).

respuesta := pregunta agregarRespuestaConUsuario: usuario texto: 'Just an answer'.
]

{ #category : #tests }
RespuestaTest >> testSoyDeUsuario [

self assert: (respuesta soyDeUsuario: usuario).
]
