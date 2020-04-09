Class {
	#name : #QuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'question'
	],
	#category : #'TP1-ui'
}

{ #category : #services }
QuestionComponent class >> question: aQuestion [

^ self new question: aQuestion.
]

{ #category : #accessing }
QuestionComponent >> question: aQuestion [

question := aQuestion.
]

{ #category : #rendering }
QuestionComponent >> renderContentOn: aCanvas [

aCanvas heading level2 with: question titulo.
self renderQuestionTopicsOn: aCanvas.
aCanvas anchor callback:[]; with: question likes size asString, ' Likes'. aCanvas space. aCanvas anchor callback:[];with: question dislikes size asString, ' Dislikes'.
question respuestas do: [ :each |
		aCanvas heading level2;with: each usuario nombreDeUsuario.
		aCanvas paragraph: each texto.
		aCanvas paragraph: each likes size asString, ' Likes | ' , each dislikes size asString, ' Dislikes'.
	 ]
]

{ #category : #rendering }
QuestionComponent >> renderQuestionTopicsOn: aCanvas [

aCanvas paragraph: [ 
		aCanvas text: 'Topicos: '.
		question topicos do: [ :each | aCanvas text: each nombre, ', ' ]
		
	 ]
]
