Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#category : #'TP1-ui'
}

{ #category : #accessing }
HeaderComponent >> model [
^ CuOOra soleInstance.
]

{ #category : #rendering }
HeaderComponent >> renderBodyOn: aCanvas [

^ self subclassResponsibility.
]

{ #category : #rendering }
HeaderComponent >> renderContentOn: aCanvas [
aCanvas heading: 'Cuoora'.
(self session user) ifNotNil: [ 
	aCanvas anchor callback:[]; with:[aCanvas heading level2 with: (self session user) nombreDeUsuario].
	aCanvas form: [ aCanvas button callback:[self answer.]; with: 'Log out'.]
 ].

self renderBodyOn: aCanvas.
	
]
