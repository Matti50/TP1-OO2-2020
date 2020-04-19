Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#instVars : [
		'mati',
		'agus'
	],
	#category : #'TP1-tests'
}

{ #category : #running }
PostTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
mati := Usuario newConNombreDeUsuario: 'matias' contraseña: '1234'.
agus := Usuario newConNombreDeUsuario: 'agustin' contraseña: '5678'.
]

{ #category : #tests }
PostTest >> testAgregarDislikeDe [

|respuesta pregunta|

pregunta := mati agregarPreguntaConTitulo: 'Es una prueba' descripcion: 'Tan solo una prueba' topicos: nil.

respuesta:= pregunta agregarRespuestaConUsuario: agus texto: 'testing..'.

respuesta agregarDislikeDe: mati.
self assert: respuesta dislikes size equals: 1.
respuesta agregarDislikeDe: mati.
self assert: respuesta dislikes size equals: 1.

respuesta agregarDislikeDe: agus.
self assert: respuesta dislikes size equals: 2.
respuesta agregarDislikeDe: agus.
self assert: respuesta dislikes size equals: 2.
]

{ #category : #tests }
PostTest >> testAgregarLikeDe [

|pregunta|

pregunta := mati agregarPreguntaConTitulo: 'Es una prueba' descripcion: 'Si, es una prueba' topicos: nil.


self assert: pregunta likes isEmpty.


pregunta agregarLikeDe: agus.
self assert: pregunta likes size equals: 1.

pregunta agregarLikeDe: mati.
self assert: pregunta likes size equals: 2.

pregunta agregarLikeDe: agus.
pregunta agregarLikeDe: mati.
self assert: pregunta likes size equals: 2.
]

{ #category : #tests }
PostTest >> testDiferenciaDeLikes [

|pregunta topicos|

topicos := Set new.

topicos add: (Topico newConNombre: 'El nuevo topico' descripcion: 'soy nuevo').

pregunta := Pregunta newConUsuario: mati titulo: 'Otra pregunta' descripcion: 'es otra de las tantas preguntas' topicos: topicos.
self assert: (pregunta diferenciaDeLikes) equals: 0.

pregunta agregarLikeDe: agus.

self assert: (pregunta diferenciaDeLikes) equals: 1. 

pregunta agregarDislikeDe: mati.

self assert: (pregunta diferenciaDeLikes) equals: 0.
pregunta agregarDislikeDe: agus.
self assert: (pregunta diferenciaDeLikes) equals: -2.
]
