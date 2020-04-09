Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'network'
	],
	#category : #'TP1-ui'
}

{ #category : #'class initialization' }
HomeComponent class >> initialize [ 



]

{ #category : #accessing }
HomeComponent class >> user: unUsuario network: aNetWork [

^ self new inicializarConUsuario: unUsuario network: aNetWork.
]

{ #category : #initialization }
HomeComponent >> inicializarConUsuario: unUsuario network: aNetwork [.

user := unUsuario.
network := aNetwork.

]

{ #category : #initialization }
HomeComponent >> initialize [ 

super initialize.

]

{ #category : #callbacks }
HomeComponent >> question: aQuestion [

self call: (QuestionComponent question: aQuestion).
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [

aCanvas heading: 'CuOOra'.
self renderUserInfoOn: aCanvas.
self renderQuestionsOn: aCanvas.

]

{ #category : #rendering }
HomeComponent >> renderQuestionsOn: aCanvas [ 

((network obtenerPreguntasRelevantesOrdenadasDe: user)takeFirst: 5) do: [ :each |
	
		aCanvas horizontalRule.
		aCanvas anchor callback: [self question: each]; with:[aCanvas heading level2; with: each titulo ].
		aCanvas paragraph: [   aCanvas text: 'Realizada por: ', each usuario nombreDeUsuario. aCanvas space. aCanvas text:'| ', each respuestas size asString, ' Respuestas']. 
		aCanvas anchor with: each likes size asString, ' Likes | '. aCanvas space. aCanvas anchor with: each dislikes size asString, ' Dislikes'. 
	 ]
]

{ #category : #rendering }
HomeComponent >> renderUserInfoOn: aCanvas [


aCanvas heading level2 with: user nombreDeUsuario.
aCanvas form: [ aCanvas button callback:[ self answer. ]; with: 'Log out'.   ]

]
