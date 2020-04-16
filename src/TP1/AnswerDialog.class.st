Class {
	#name : #AnswerDialog,
	#superclass : #QuestionDetailComponent,
	#instVars : [
		'answerText'
	],
	#category : #'TP1-ui'
}

{ #category : #accessing }
AnswerDialog >> answerText [
	^ answerText
]

{ #category : #accessing }
AnswerDialog >> answerText: anObject [
	answerText := anObject
]

{ #category : #rendering }
AnswerDialog >> renderLowBarOn: aCanvas [

aCanvas form: [  
aCanvas heading level: 2; with: 'RESPONDER'.
aCanvas textArea placeholder: 'escriba aqui su respuesta'; on: #answerText of: self.
aCanvas button callback: [ self answer. ]; with: 'Cancelar'.
aCanvas space.
aCanvas button callback: [ self validateAndAnswer. self answer ]; with: 'Aceptar'.
].
]

{ #category : #public }
AnswerDialog >> validateAndAnswer [

self answerText ifNotNil:  [ 
		question agregarRespuestaConUsuario: (self session user) texto: self answerText.	
	
	 ].

]
