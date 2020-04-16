Class {
	#name : #QuestionAndAnswersComponent,
	#superclass : #QuestionDetailComponent,
	#category : #'TP1-ui'
}

{ #category : #hooks }
QuestionAndAnswersComponent >> children [

^ question respuestas collect: [ :each | AnswerComponent post: each ].
]

{ #category : #rendering }
QuestionAndAnswersComponent >> renderLowBarOn: aCanvas [
 
 self children do: [ :each|
		
		aCanvas render: each.
		aCanvas horizontalRule.
].
	aCanvas heading level: 2; with: 'No hay mas respuestas'.
	aCanvas anchor callback: [ self call: (AnswerDialog withQuestion: question) ]; with: [ aCanvas button with: 'Agregar respuesta'.]
]
