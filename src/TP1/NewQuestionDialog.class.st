Class {
	#name : #NewQuestionDialog,
	#superclass : #HeaderComponent,
	#instVars : [
		'title',
		'text',
		'topics'
	],
	#category : #'TP1-ui'
}

{ #category : #private }
NewQuestionDialog >> processTopics: someText [

^ ((someText findTokens: ',') collect: [ :each | Topico newConNombre: each trimLeft descripcion: each trimLeft ]) asSet.
]

{ #category : #rendering }
NewQuestionDialog >> renderBodyOn: aCanvas [
"Esto se que se repite, pero vale la pena hacer un componente solo para esto?"
aCanvas form: [ 
	
	self renderInputsOn: aCanvas.
	aCanvas button callback: [ self answer ]; with: 'Cancelar'.
	aCanvas space.
	aCanvas button callback: [ self validateAndSendQuestion ]; with: 'Aceptar'.
	 ]

]

{ #category : #rendering }
NewQuestionDialog >> renderInputsOn: aCanvas [

	aCanvas heading level: 2; with: 'Titulo'.
	aCanvas textInput on: #title of: self; placeholder: 'Escriba aqui el titulo de la nueva pregunta'; style: 'font-size: 20px; width: 500px'.
	aCanvas heading level: 2; with: 'Desarrollo'.
	aCanvas textArea on: #text of: self; placeholder: 'Escriba aqui el desarrollo de la pregunta'; style: 'font-size: 10px; width: 500px; resize: none'; rows: 25.
	aCanvas heading level: 2; with: 'Topicos'.
	aCanvas textInput on: #topics of: self; placeholder: 'Ingrese tópicos separados por coma'; style: 'font-size: 20px; width: 500px'.
	aCanvas break.
	aCanvas break.
]

{ #category : #accessing }
NewQuestionDialog >> text [
	^ text
]

{ #category : #accessing }
NewQuestionDialog >> text: anObject [
	text := anObject
]

{ #category : #accessing }
NewQuestionDialog >> title [
	^ title
]

{ #category : #accessing }
NewQuestionDialog >> title: anObject [
	title := anObject
]

{ #category : #accessing }
NewQuestionDialog >> topics [
	^ topics
]

{ #category : #accessing }
NewQuestionDialog >> topics: anObject [
	topics := anObject
]

{ #category : #callbacks }
NewQuestionDialog >> validateAndSendQuestion [
"La forma de hacer esto sin la variable temporal?"
	| topicList |
	self text isNotEmpty & self title isNotEmpty & self topics isNotEmpty
		ifFalse: [ ^ self ].
		
	topicList := self processTopics: self topics.
	
	self session user
		agregarPreguntaConTitulo: self title
		descripcion: self text
		topicos: topicList.
		
	self model agregarTopicos: topicList.
	self answer.
]
