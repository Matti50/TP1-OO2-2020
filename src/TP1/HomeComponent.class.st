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

^ (self model obtenerPreguntasRelevantesOrdenadasDe: (self session user)) collect: [:each | QuestionComponent post: each. ]

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
HomeComponent >> renderBodyOn: aCanvas [


aCanvas button with: 'Hacer una nueva pregunta'.
aCanvas heading: 'Ultimas Preguntas'.
self renderQuestionsOn: aCanvas.

]

{ #category : #rendering }
HomeComponent >> renderQuestionsOn: aCanvas [ 

self children do: [:each | aCanvas render: each. aCanvas horizontalRule ].
]
