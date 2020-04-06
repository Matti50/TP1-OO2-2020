Class {
	#name : #Respuesta,
	#superclass : #Post,
	#instVars : [
		'texto',
		'pregunta'
	],
	#category : #'TP1-modelo'
}

{ #category : #'instance creation' }
Respuesta class >> newConUsuario: unUsuario texto: unTexto pregunta: unaPregunta [

^ (self newConUsuario: unUsuario ) inicializarConTexto: unTexto  pregunta: unaPregunta.
]

{ #category : #initialization }
Respuesta >> inicializarConTexto: unTexto pregunta: unaPregunta [

texto := unTexto.
pregunta := unaPregunta.
]

{ #category : #public }
Respuesta >> soyDeUsuario: unUsuario [

^ usuario == unUsuario.
]
