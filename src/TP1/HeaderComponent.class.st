Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'TP1-ui'
}

{ #category : #accessing }
HeaderComponent >> model [
^ CuOOra soleInstance.
]

{ #category : #rendering }
HeaderComponent >> renderContentOn: aCanvas [
aCanvas heading: 'Cuoora'.
(self session user) ifNotNil: [ 
	aCanvas heading level2 with: (self session user) nombreDeUsuario.
	aCanvas form: [ aCanvas button callback:[self answer.]; with: 'Log out'.]
 ]
	
]
