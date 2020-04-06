Class {
	#name : #Voto,
	#superclass : #Object,
	#instVars : [
		'fechaDeCreacion',
		'horaDeCreacion',
		'usuario'
	],
	#category : #'TP1-modelo'
}

{ #category : #'instance creation' }
Voto class >> newConUsuario: unUsuario [

^ self new inicializarConUsuario: unUsuario.
]

{ #category : #initialization }
Voto >> inicializarConUsuario: unUsuario [

usuario := unUsuario.
fechaDeCreacion := Date today.
horaDeCreacion := Time new print24.
]

{ #category : #public }
Voto >> miAutorEs: unUsuario [

"Devuelve true si el autor del voto es unUsuario, de lo contrario devuelve false"

^ (usuario == unUsuario)
]
