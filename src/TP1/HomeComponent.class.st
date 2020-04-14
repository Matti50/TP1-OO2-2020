Class {
	#name : #HomeComponent,
	#superclass : #HeaderComponent,
	#category : #'TP1-ui'
}

{ #category : #'class initialization' }
HomeComponent class >> initialize [ 



]

{ #category : #hooks }
HomeComponent >> children [ 

^ (self model obtenerPreguntasRelevantesOrdenadasDe: (self session user)) collect: [:each | QuestionComponent question: each. ]

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

super renderContentOn: aCanvas.
self renderQuestionsOn: aCanvas.

]

{ #category : #rendering }
HomeComponent >> renderQuestionsOn: aCanvas [ 

self children do: [:each | aCanvas render: each ].
]
