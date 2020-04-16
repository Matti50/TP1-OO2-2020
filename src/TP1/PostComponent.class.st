Class {
	#name : #PostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'TP1-ui'
}

{ #category : #public }
PostComponent class >> post: aPost [

^	self new post: aPost.
]

{ #category : #callbacks }
PostComponent >> addDislike [

post agregarDislikeDe: (self session user).
]

{ #category : #callbacks }
PostComponent >> addLike [

post agregarLikeDe: (self session user).
]

{ #category : #accessing }
PostComponent >> post: aPost [

post := aPost.
]

{ #category : #rendering }
PostComponent >> renderStatusOn: aCanvas [.


aCanvas paragraph: [ aCanvas text: post cantidadDeLikes asString, ' Likes |'. aCanvas text: ' ', post cantidadDeDislikes asString, ' Dislikes'.].
aCanvas anchor callback: [ post agregarLikeDe: (self session user) ]; with: 'Like'.
aCanvas space.
aCanvas anchor callback: [ post agregarDislikeDe: (self session user) ]; with: 'Dislike'.
]
