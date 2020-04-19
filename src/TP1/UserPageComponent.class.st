Class {
	#name : #UserPageComponent,
	#superclass : #HeaderComponent,
	#instVars : [
		'user'
	],
	#category : #'TP1-ui'
}

{ #category : #'as yet unclassified' }
UserPageComponent class >> withUser: anUser [

^ self new user: anUser.
]

{ #category : #hooks }
UserPageComponent >> children [

^ user preguntas collect: [ :each | QuestionComponent post: each ].
]

{ #category : #rendering }
UserPageComponent >> renderBodyOn: aCanvas [

aCanvas heading: 'Preguntas de ', user nombreDeUsuario. 
self renderFollowButtonOn: aCanvas.
self renderUserQuestionsOn: aCanvas


]

{ #category : #rendering }
UserPageComponent >> renderFollowButtonOn: aCanvas [

(self session user == user)
ifFalse: [ 
	(self session user sigoA: user)
	ifFalse: [ 
			aCanvas anchor callback: [ self session user seguirA: user. ]; with: 'Follow'.
		 ]
	
	 ]
]

{ #category : #rendering }
UserPageComponent >> renderUserQuestionsOn: aCanvas [

self children do: [ :each | 
		aCanvas horizontalRule.
		aCanvas render: each.
	 ]
]

{ #category : #accessing }
UserPageComponent >> user: anUser [

user := anUser.
]
