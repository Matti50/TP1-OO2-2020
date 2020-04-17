Class {
	#name : #AnswerComponent,
	#superclass : #PostComponent,
	#category : #'TP1-ui'
}

{ #category : #rendering }
AnswerComponent >> renderMainContentOn:  aCanvas [

aCanvas heading level: 3;with:[ aCanvas text: 'Respuesta de: '. aCanvas anchor callback: [ self openUserPage ]; with: post usuario nombreDeUsuario ].
aCanvas paragraph with: post texto.
]
