Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'TP1-modelo'
}

{ #category : #'instance creation' }
Topico class >> newConNombre: unNombre descripcion: unaDescripcion [

^ self new inicializarConNombre: unNombre descripcion: unaDescripcion. 
]

{ #category : #initialization }
Topico >> inicializarConNombre: unNombre descripcion: unaDescripcion [ 
nombre:= unNombre.
descripcion:= unaDescripcion.
]

{ #category : #accessing }
Topico >> nombre [
^ nombre.
]
