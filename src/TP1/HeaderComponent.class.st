Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#category : #'TP1-ui'
}

{ #category : #callbacks }
HeaderComponent >> expireSession [

self session unregister. 
self requestContext redirectTo: self application url.
]

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

self renderUserInfoOn: aCanvas.

self renderBodyOn: aCanvas.
	
]

{ #category : #callbacks }
HeaderComponent >> renderUserInfoOn: aCanvas [

(self session user) ifNotNil: [ 
	
	aCanvas anchor 
	callback:[self call: (UserPageComponent withUser: (self session user))]; 
	with:[aCanvas heading level2 with: (self session user) nombreDeUsuario].
	
	aCanvas form: [ aCanvas button callback:[self expireSession]; with: 'Log out'.]
 ].
]
