Class {
	#name : #QuestionDetailComponent,
	#superclass : #HeaderComponent,
	#instVars : [
		'question'
	],
	#category : #'TP1-ui'
}

{ #category : #'instance creation' }
QuestionDetailComponent class >> withQuestion: aQuestion [.

^ self new withQuestion: aQuestion
]

{ #category : #hooks }
QuestionDetailComponent >> children [

^ OrderedCollection new add: (QuestionComponent post: question); yourself.
]

{ #category : #rendering }
QuestionDetailComponent >> renderBodyOn: aCanvas [


aCanvas render: (QuestionComponent post: question).
aCanvas horizontalRule.
self renderLowBarOn: aCanvas.
	
]

{ #category : #rendering }
QuestionDetailComponent >> renderLowBarOn: aCanvas [

^ self subclassResponsibility.
]

{ #category : #initialization }
QuestionDetailComponent >> withQuestion: aQuestion [


question := aQuestion.

]
