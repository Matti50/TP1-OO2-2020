Class {
	#name : #AnswerComponent,
	#superclass : #PostComponent,
	#category : #'TP1-ui'
}

{ #category : #rendering }
AnswerComponent >> renderMainContentOn:  aCanvas [

aCanvas anchor callback:[]; with: [aCanvas heading level: 3; with: 'Respuesta de: ', post usuario nombreDeUsuario].
aCanvas paragraph with: post texto.
]
