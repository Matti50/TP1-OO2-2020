Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'TP1-modelo'
}

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [

soleInstance := nil.
]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [

soleInstance ifNil: [ soleInstance := ((CuooraSampleLoader new) loadSampleDataIn: (self new)) ].
^ soleInstance.
]

{ #category : #public }
CuOOra >> agregarTopicoConNombre: unNombre descripcion: unaDescripcion [ 
"Metodo que agrega un topico al sistema"

^ topicos add: (Topico newConNombre: unNombre descripcion: unaDescripcion )
]

{ #category : #public }
CuOOra >> agregarTopicos: unosTopicos [
	"En este caso, se agrega una coleccion de topicos a la collection. Chequea que ya no haya uno con el mismo nombre"

	"Vale la pena? en el otro no chequeamos por la existencia o no del topico"

	topicos addAll:(unosTopicos reject: [ :each | self chequearExistenciaDeTopico: each nombre])
]

{ #category : #testing }
CuOOra >> agregarUsuario: unUsuario [

usuarios add: unUsuario.
]

{ #category : #public }
CuOOra >> agregarUsuarioConNombre: unNombreDeUsuario contraseña: unaContraseña [
"Metodo que agrega un usuario a la coleccion"
^ usuarios add: (Usuario newConNombreDeUsuario: unNombreDeUsuario contraseña: unaContraseña)

]

{ #category : #testing }
CuOOra >> borrarTopico: unTopico [

topicos remove: unTopico.
]

{ #category : #testing }
CuOOra >> borrarUsuario: unUsuario [

usuarios remove: unUsuario.
]

{ #category : #private }
CuOOra >> calcularDiferenciaDeLikesDe: unUsuario [

^ ((unUsuario preguntas) sumNumbers: [ :pregunta| pregunta diferenciaDeLikes ]) +
((self obtenerRespuestasDe: unUsuario) sumNumbers: [ :respuesta | respuesta diferenciaDeLikes ]).
]

{ #category : #public }
CuOOra >> calcularPuntajeDe: unUsuario [
"Quizas es un poco ineficiente. Se puede solucionar usando los ;. Recordar esa alternativa"
^ (unUsuario preguntas size * 20) + (((self obtenerRespuestasDe: unUsuario) size) * 50) + (self calcularDiferenciaDeLikesDe: unUsuario).
]

{ #category : #private }
CuOOra >> chequearExistenciaDeTopico: unNombre [

^ topicos anySatisfy: [ :a | a nombre = unNombre ] 
]

{ #category : #public }
CuOOra >> chequearExistenciaDeUsuarioConNombre: unNombre contraseña: unaContraseña [
^ (usuarios detect: [ :usuario | usuario cumploConNombre: unNombre contraseña: unaContraseña ] ifNone: [ ^ nil ]).

]

{ #category : #initialization }
CuOOra >> initialize [ 
"inicializo las colecciones"

usuarios := Set new.
topicos := Set new. 
]

{ #category : #public }
CuOOra >> obtenerPreguntasDeTopico: unTopico [

^ usuarios flatCollect: [ :usuario | usuario obtenerPreguntasDeTopico: unTopico ].
]

{ #category : #private }
CuOOra >> obtenerPreguntasDeTopicosDeInteresDe: unUsuario [
"obtiene las preguntas de itneres del usuario de acuerdo a los topicos de su interes"
^ (unUsuario topicosDeInteres flatCollect: [:topico | self obtenerPreguntasDeTopico: topico]).
]

{ #category : #public }
CuOOra >> obtenerPreguntasRelevantesDe: unUsuario [
"No hubo una mejor forma que se nos ocurriera, primero lo transformas en orderedCollection para poder ordenarlas y despues en SET para 
eliminar las posibles repeticiones, cualquier feedback sobre esto viene bien"
^ (((self obtenerPreguntasDeTopicosDeInteresDe: unUsuario) union: (unUsuario obtenerPreguntasDeSeguidos)) 
  asOrderedCollection sort: [ :a :b| a fechaDeCreacion <= b fechaDeCreacion]) asSet

]

{ #category : #public }
CuOOra >> obtenerRespuestasDe: unUsuario [
"obtiene las respuestas de un usuario dado"

^ (usuarios flatCollect: [:usuario| usuario obtenerRespuestasDe:unUsuario]).
]

{ #category : #testing }
CuOOra >> topicos [

^ topicos
]

{ #category : #testing }
CuOOra >> usuarios [

^ usuarios.
]
