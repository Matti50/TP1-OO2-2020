Class {
	#name : #Pregunta,
	#superclass : #Post,
	#instVars : [
		'titulo',
		'descripcion',
		'respuestas',
		'topicos'
	],
	#category : #'TP1-modelo'
}

{ #category : #'instance creation' }
Pregunta class >> newConUsuario: unUsuario titulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos [

^ (self newConUsuario: unUsuario) inicializarConTitulo: unTitulo  descripcion: unaDescripcion topicos: unosTopicos 
]

{ #category : #public }
Pregunta >> agregarRespuestaConUsuario: unUsuario texto: unTexto [
"agrega una respuesta a la coleccion de respuestas"
^ respuestas add: (Respuesta newConUsuario: unUsuario  texto: unTexto pregunta: self).
]

{ #category : #initialization }
Pregunta >> inicializarConTitulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos [
"metodo de inicializacion completo"

respuestas := OrderedCollection new.
titulo := unTitulo.
descripcion := unaDescripcion.
topicos := unosTopicos.

]

{ #category : #public }
Pregunta >> obtenerRespuestasDe: unUsuario [

^ respuestas select: [ :respuesta | respuesta soyDeUsuario:  unUsuario]
]

{ #category : #testing }
Pregunta >> respuestas [
	^ respuestas.
]

{ #category : #public }
Pregunta >> respuestasOrdenadas [
"devuelve las respuestas ordenadas segun la cantidad de likes"
"Chequear esto? esta bien asi?"
^ respuestas sort: [ :res1 :res2| (res1 likes size) - (res1 dislikes size) >= ((res2 likes size) - (res2 dislikes size))].
]

{ #category : #public }
Pregunta >> soyDeTopico: unTopico [

^ topicos includes: unTopico.
]

{ #category : #accessing }
Pregunta >> titulo [

^ titulo
]

{ #category : #accessing }
Pregunta >> topicos [ 

^ topicos.
]
