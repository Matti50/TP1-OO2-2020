Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'mati',
		'agus'
	],
	#category : #'TP1-tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
mati := Usuario newConNombreDeUsuario: 'mati' contraseña: '123'.
agus := Usuario newConNombreDeUsuario: 'agus' contraseña: '3456'.
]

{ #category : #tests }
UsuarioTest >> testAgregarPreguntaConTituloDescripcionTopicos [

self assert: mati preguntas size equals: 0.

mati agregarPreguntaConTitulo: 'Que es OO2?' descripcion: 'Que materia es?' topicos: nil.

self assert: mati preguntas size equals: 1.
]

{ #category : #tests }
UsuarioTest >> testAgregarTopicoDeInteres [

|topic|

topic := Topico newConNombre: 'Tecnologia' descripcion: 'Topico destinados a los posts relacionados a la tecnoloiga'.

self assert: mati topicosDeInteres size equals: 0.

mati agregarTopicoDeInteres: topic.

self assert: mati topicosDeInteres size equals: 1.
]

{ #category : #tests }
UsuarioTest >> testBorrarPregunta [

|question|

self assert: mati preguntas size equals: 0.

question := mati agregarPreguntaConTitulo: '¿Que es la UNLP' descripcion: 'Que tipo de entidad es?' topicos: nil.

self assert: mati preguntas size equals: 1.

mati borrarPregunta: question.

self assert: mati preguntas size equals: 0. 
]

{ #category : #tests }
UsuarioTest >> testCumploConNombrecontraseña [

self assert: (mati cumploConNombre: 'mati' contraseña: '123').
self assert: (agus cumploConNombre: 'agus' contraseña: '3456').
self deny: (agus cumploConNombre: 'afgus' contraseña: '23232332').
self deny: (agus cumploConNombre: 'agus' contraseña: '23232323').
self deny: (mati cumploConNombre: 'mati' contraseña: '456').
]

{ #category : #tests }
UsuarioTest >> testObtenerPreguntasDeSeguidos [


mati seguirA: agus.

self assert: (mati obtenerPreguntasDeSeguidos) size equals: 0. 

agus agregarPreguntaConTitulo: '¿Quien fue Allan Turing?' descripcion: 'Quisiera saber quien fue y que rol tuvo en la WW2' topicos: nil.

self assert: (mati obtenerPreguntasDeSeguidos ) size equals: 1.
]

{ #category : #tests }
UsuarioTest >> testObtenerPreguntasDeTopico [ 

|topicos topic1 topic2 preguntas p|

topicos := OrderedCollection new.
topic1 := Topico newConNombre: 'Programacion en general' descripcion: 'Topicos de los post de programacion en general'.
topic2 := Topico newConNombre: 'SPA' descripcion: 'Dedicado a los web devs'.
topicos add: topic1.

preguntas:= mati obtenerPreguntasDeTopico: topic1.
self assert: preguntas size equals: 0.

p := mati agregarPreguntaConTitulo: 'Que es la programacion' descripcion: 'Es una simple pregunta' topicos: topicos.

preguntas := mati obtenerPreguntasDeTopico: topic1.
self assert: preguntas size equals: 1.
preguntas := mati obtenerPreguntasDeTopico: topic2.
self assert: preguntas size equals:0.

topicos add: topic2.

mati agregarPreguntaConTitulo: '¿Que es smalltalk?' descripcion: 'Quiero saber mas de ese lenguaje' topicos: topicos.
preguntas := mati obtenerPreguntasDeTopico: topic2.
self assert: preguntas size equals: 2.

mati borrarPregunta: p.
preguntas := mati obtenerPreguntasDeTopico: topic1.
self assert: preguntas size equals: 1.

]

{ #category : #tests }
UsuarioTest >> testObtenerRespuestasDe [

|pregunta respuestas|

pregunta := mati agregarPreguntaConTitulo: '¿Que es una variable?' descripcion: 'Pregunta conceptual' topicos: nil.

self assert: (mati obtenerRespuestasDe: agus) size equals: 0.
pregunta agregarRespuestaConUsuario: agus texto: 'Se trata de una representacion abstracta de un dato del mundo real'.


self assert: (mati obtenerRespuestasDe: mati) size equals: 0.
respuestas := mati obtenerRespuestasDe: agus.
self assert: respuestas size equals: 1.

pregunta agregarRespuestaConUsuario: mati texto: 'Gracias!!'.

self assert: (mati obtenerRespuestasDe: mati) size equals: 1.
]

{ #category : #tests }
UsuarioTest >> testSeguirA [

self assert: mati seguidos size equals: 0.

mati seguirA: agus.

self assert: mati seguidos size equals: 1. 
]

{ #category : #tests }
UsuarioTest >> testSigoA [

self assert: (mati seguidos size) equals: 0.
self assert: (agus seguidos size) equals: 0.
mati seguirA: agus.

self assert: (mati seguidos anySatisfy:[:each| each = agus]).
self deny: (agus seguidos anySatisfy:[:each | each = mati] ).
]

{ #category : #tests }
UsuarioTest >> testTengoPregunta [

|question|

question := mati agregarPreguntaConTitulo: '¿Quien fue Ada Lovelace?' descripcion: 'Quien fue esta brillante mujer?' topicos: nil.

self assert: (mati tengoPregunta: question).
self deny: (agus tengoPregunta: question).
]
