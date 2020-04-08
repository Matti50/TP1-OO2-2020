Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombreDeUsuario',
		'contraseña',
		'fechaDeCreacion',
		'horaDeCreacion',
		'preguntas',
		'seguidos',
		'topicosDeInteres'
	],
	#category : #'TP1-modelo'
}

{ #category : #'instance creation' }
Usuario class >> newConNombreDeUsuario: unNombre contraseña: unaContraseña [

^ self new inicializarConNombreDeUsuario: unNombre contraseña: unaContraseña
]

{ #category : #public }
Usuario >> agregarPreguntaConTitulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos [
"Se agrega una pregunta a la coleccion de preguntas"
^ preguntas add: (Pregunta newConUsuario: self titulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos).

]

{ #category : #public }
Usuario >> agregarTopicoDeInteres: unTopico [
"agrega un topico a los intereses del usuario"

topicosDeInteres add: unTopico.
]

{ #category : #public }
Usuario >> borrarPregunta: unaPregunta [

^ preguntas remove: unaPregunta.
]

{ #category : #accesing }
Usuario >> contraseña [
^ contraseña.
]

{ #category : #public }
Usuario >> cumploConNombre: unNombre contraseña: unaContraseña [

^ ((nombreDeUsuario = unNombre) and: [ contraseña = unaContraseña ]).
]

{ #category : #accesing }
Usuario >> fechaDeCreacion [

^ fechaDeCreacion.
]

{ #category : #initialization }
Usuario >> inicializarConNombreDeUsuario: unNombre contraseña: unaContraseña [

nombreDeUsuario:= unNombre.
contraseña:= unaContraseña.
fechaDeCreacion := Date today.
horaDeCreacion := Time current.
preguntas:= OrderedCollection new.
seguidos:= Set new.
topicosDeInteres := Set new.
]

{ #category : #accesing }
Usuario >> nombreDeUsuario [

^ nombreDeUsuario 
]

{ #category : #public }
Usuario >> obtenerPreguntasDeSeguidos [

"Devuelve el conjunto de preguntas de los seguidos"

^ seguidos flatCollect: [ :each | each preguntas ]
]

{ #category : #public }
Usuario >> obtenerPreguntasDeTopico: unTopico [

^ preguntas select: [ :pregunta | pregunta soyDeTopico: unTopico ].
]

{ #category : #public }
Usuario >> obtenerRespuestasDe: otroUsuario [

^ preguntas flatCollect: [ :pregunta| pregunta obtenerRespuestasDe: otroUsuario ].
]

{ #category : #accesing }
Usuario >> preguntas [

^ preguntas.
]

{ #category : #testing }
Usuario >> seguidos [

^ seguidos.

]

{ #category : #public }
Usuario >> seguirA: unUsuario [
"Metodo para agregar un seguido a la coleccion"
seguidos add: unUsuario.
]

{ #category : #public }
Usuario >> tengoPregunta: unaPregunta [
"Reviso si tengo unaPregunta en mi coleccion de preguntas"

^ preguntas includes: unaPregunta.
]

{ #category : #accesing }
Usuario >> topicosDeInteres [

^ topicosDeInteres.
]
