Class {
	#name : #HomeComponent,
	#superclass : #HeaderComponent,
	#category : #'TP1-ui'
}

{ #category : #hooks }
HomeComponent >> children [ 

^ (self model obtenerPreguntasRelevantesDe: (self session user)) collect: [:each | QuestionComponent post: each. ]

]

{ #category : #rendering }
HomeComponent >> renderBodyOn: aCanvas [

aCanvas break.
aCanvas anchor callback: [ self call: (NewQuestionDialog new). ]; with: [   aCanvas button with: 'Hacer una nueva pregunta'].
aCanvas heading: 'Ultimas Preguntas'.
self renderQuestionsOn: aCanvas.

]

{ #category : #rendering }
HomeComponent >> renderQuestionsOn: aCanvas [ 

self children do: [:each | aCanvas render: each. aCanvas horizontalRule ].
]
