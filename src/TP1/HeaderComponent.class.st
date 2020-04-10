Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'TP1-ui'
}

{ #category : #'instance creation' }
HeaderComponent class >> withParent: aParent [

 ^ self new parent: aParent.
]

{ #category : #accessing }
HeaderComponent >> parent: aParent [

parent:= aParent.
]

{ #category : #rendering }
HeaderComponent >> renderContentOn: aCanvas [
aCanvas heading: 'Cuoora'.
(self session user) ifNotNil: [ 
	aCanvas heading level2 with: (self session user) nombreDeUsuario.
	aCanvas form: [ aCanvas button callback:[self session presenter answer.]; with: 'Log out'.]
 ]
	
]
