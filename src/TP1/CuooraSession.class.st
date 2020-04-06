Class {
	#name : #CuooraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'TP1-ui'
}

{ #category : #'as yet unclassified' }
CuooraSession >> isLoggedIn [

^ user notNil.
]

{ #category : #'as yet unclassified' }
CuooraSession >> login: aString [

user := aString.
]

{ #category : #'as yet unclassified' }
CuooraSession >> logout [ 

user := nil.
]

{ #category : #'as yet unclassified' }
CuooraSession >> user [ 

^ user.
]
