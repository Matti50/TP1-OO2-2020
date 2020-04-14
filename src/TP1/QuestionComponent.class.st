Class {
	#name : #QuestionComponent,
	#superclass : #PostComponent,
	#category : #'TP1-ui'
}

{ #category : #services }
QuestionComponent class >> question: aQuestion [

^ self new question: aQuestion.
]

{ #category : #accessing }
QuestionComponent >> question: aQuestion [

post := aQuestion.
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [


aCanvas heading level2 with: post titulo.
self renderQuestionTopicsOn: aCanvas.
self renderStatusOn: aCanvas.
"question respuestas do: [ :each |
		aCanvas heading level2;with: each usuario nombreDeUsuario.
		aCanvas paragraph: each texto.
		aCanvas paragraph: each likes size asString, ' Likes | ' , each dislikes size asString, ' Dislikes'.
	 ]"
]

{ #category : #rendering }
QuestionComponent >> renderQuestionTopicsOn: aCanvas [

aCanvas paragraph: [ 
		aCanvas text: 'Topicos: '.
		post topicos do: [ :each | aCanvas text: each nombre, ', ' ]
		
	 ]
]
