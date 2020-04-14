Class {
	#name : #PostComponent,
	#superclass : #HeaderComponent,
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

aCanvas anchor callback: [ self addLike ]; with: post cantidadDeDislikes asString, ' Likes'.
aCanvas space. aCanvas space.
aCanvas anchor callback: [ self addDislike ]; with: post cantidadDeDislikes asString, ' Dislikes'.
]
