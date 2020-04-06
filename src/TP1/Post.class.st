Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'usuario',
		'likes',
		'dislikes',
		'fechaDeCreacion',
		'horaDeCreacion'
	],
	#category : #'TP1-modelo'
}

{ #category : #'instance creation' }
Post class >> newConUsuario: unUsuario [
"Metodo de creacion completo"

^ self new inicializarConUsuario: unUsuario.
]

{ #category : #public }
Post >> agregarDislikeDe: unUsuario [
"metodo que agrega un dislike a un post"
self chequearLikeYBorrarDe: unUsuario.
self chequearDislikeYAgregarDe: unUsuario.
]

{ #category : #public }
Post >> agregarLikeDe: unUsuario [
	"metodo que agrega un like a un post"
	"se mejoro un poco, se puede mejorar mas. Anda. El caso en que se borro el dislike y no hay chance de que este en likes."
	"Una posible solucion puede ser pasar la primer funcion como parametro de la segunda devolviendo boolean y que la segunda decida"
	self chequearDislikeYBorrarDe: unUsuario.
	self chequearLikeYAgregarDe: unUsuario.
	
]

{ #category : #private }
Post >> chequearDislikeYAgregarDe: unUsuario [

dislikes detect:[:vot| vot miAutorEs: unUsuario]ifNone:[dislikes add: (Voto newConUsuario: unUsuario)]
]

{ #category : #private }
Post >> chequearDislikeYBorrarDe: unUsuario [
"chequea y remueve el voto si lo encuentra"
dislikes detect: [ :voto| voto miAutorEs: unUsuario ] ifFound: [:vot| dislikes remove: vot ].

]

{ #category : #private }
Post >> chequearLikeYAgregarDe: unUsuario [

likes detect: [ :vot | vot miAutorEs: unUsuario ] ifNone:[likes add:(Voto newConUsuario: unUsuario)].
]

{ #category : #private }
Post >> chequearLikeYBorrarDe: unUsuario [
"chequea y remueve el voto en caso de haber"

likes detect: [ :voto| voto miAutorEs: unUsuario] ifFound: [:vot| likes remove: vot ].

]

{ #category : #public }
Post >> diferenciaDeLikes [

^ ((likes size) - (dislikes size)).
]

{ #category : #accessing }
Post >> dislikes [ 
^ dislikes
]

{ #category : #initialization }
Post >> inicializarConUsuario: unUsuario [
"metodo de inicializacion completo"
usuario := unUsuario.
horaDeCreacion := Time current.
fechaDeCreacion := Date today.
likes:= Set new. "O un bag?"
dislikes:= Set new. "O un bag?"

]

{ #category : #accessing }
Post >> likes [
^ likes
]
