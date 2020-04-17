Class {
	#name : #QuestionComponent,
	#superclass : #PostComponent,
	#category : #'TP1-ui'
}

{ #category : #rendering }
QuestionComponent >> renderMainContentOn: aCanvas [

aCanvas anchor callback: [self session presenter call: (QuestionAndAnswersComponent withQuestion: post). self answer	]; with:[aCanvas heading level2 with: post titulo]	.
self renderQuestionTopicsOn: aCanvas.
aCanvas paragraph:[aCanvas text: 'Realizada por: '. aCanvas anchor callback: [ self openUserPage ]; with: post usuario nombreDeUsuario.]
]

{ #category : #rendering }
QuestionComponent >> renderQuestionTopicsOn: aCanvas [

aCanvas paragraph: [ 
		aCanvas text: 'Topicos: '.
		post topicos do: [ :each | aCanvas text: each nombre, ', ' ]
		
	 ]
]
