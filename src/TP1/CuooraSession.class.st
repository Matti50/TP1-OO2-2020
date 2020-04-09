Class {
	#name : #CuooraSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'TP1-ui'
}

{ #category : #accessing }
CuooraSession >> user [

^ user.
]

{ #category : #accessing }
CuooraSession >> user: anUser [

user := anUser.
]
