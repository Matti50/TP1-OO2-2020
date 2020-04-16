Class {
	#name : #AnswerComponent,
	#superclass : #PostComponent,
	#category : #'TP1-ui'
}

{ #category : #rendering }
AnswerComponent >> renderContentOn: aCanvas [

aCanvas heading level: 3; with: 'Respuesta realizada por: ', post usuario nombreDeUsuario.
aCanvas paragraph with: post texto.
self renderStatusOn: aCanvas.
]
