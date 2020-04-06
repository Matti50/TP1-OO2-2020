Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'TP1-modelo'
}

{ #category : #'instance creation' }
CuOOra class >> cargada [

soleInstance ifNil: [ soleInstance := self new cargada ].
^ soleInstance.
]

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [

soleInstance := nil.
]

{ #category : #public }
CuOOra >> agregarTopicoConNombre: unNombre descripcion: unaDescripcion [ 
"Metodo que agrega un topico al sistema"

^ topicos add: (Topico newConNombre: unNombre descripcion: unaDescripcion )
]

{ #category : #public }
CuOOra >> agregarUsuarioConNombre: unNombreDeUsuario contraseña: unaContraseña [
"Metodo que agrega un usuario a la coleccion"
^ usuarios add: (Usuario newConNombreDeUsuario: unNombreDeUsuario contraseña: unaContraseña)

]

{ #category : #testing }
CuOOra >> borrarPregunta: unaPregunta [
"metodo que borra una pregunta"
"Esta bien? Debo chequear cual es el usuario que tiene la pregunta. O asumo que ya se que usuario tiene la pregunta y no es necesario buscarla?"
"En ese caso este metodo esta demas. Seria responsabilidad del usuairo nomas"
^ usuarios detect: [ :usuario | usuario  tengoPregunta: unaPregunta ] ifFound: [ :usuario | usuario  borrarPregunta: unaPregunta ].
]

{ #category : #testing }
CuOOra >> borrarTopico: unTopico [

topicos remove: unTopico.
]

{ #category : #testing }
CuOOra >> borrarUsuario: unUsuario [

usuarios remove: unUsuario.
]

{ #category : #private }
CuOOra >> calcularDiferenciaDeLikesDe: unUsuario [

^ ((self obtenerPreguntasDe: unUsuario) sumNumbers: [ :pregunta| pregunta diferenciaDeLikes ]) +
((self obtenerRespuestasDe: unUsuario) sumNumbers: [ :respuesta | respuesta diferenciaDeLikes ]).
]

{ #category : #public }
CuOOra >> calcularPuntajeDe: unUsuario [
"Quizas es un poco ineficiente. Se puede solucionar usando los ;. Recordar esa alternativa"
^ (unUsuario preguntas size * 20) + (((self obtenerRespuestasDe: unUsuario) size) * 50) + (self calcularDiferenciaDeLikesDe: unUsuario).
]

{ #category : #initialization }
CuOOra >> cargada [

|usuario1 usuario2 usuario3 top1 top2 top3 pregunta1 pregunta2 pregunta3 topicos1 topicos2 topicos3 topicos4 topicos5 topicos6|

top1:= self agregarTopicoConNombre: 'Programacion' descripcion: 'Programacion'.
top2 :=  self agregarTopicoConNombre: 'Web Develpoment'  descripcion: 'Every question related to web development'.
top3 := self agregarTopicoConNombre: 'Eng Lang'  descripcion: 'Questions for the english speaking community'.




topicos1 := Set new.
topicos2 := Set new.
topicos3 := Set new.
topicos4 := Set new.
topicos5 := Set new.
topicos6 := Set new.

topicos1 add: top1.
topicos2 add: top1; add: top2; add: top3.
topicos3 add: top1.
topicos3 add: top3.
topicos4 add: top1.
topicos4 add: top2.
topicos5 add: top2.
topicos6 add: top3.

usuario1 := self agregarUsuarioConNombre: 'Matti50' contraseña: '12345'.
usuario2 := self agregarUsuarioConNombre: 'rochi33' contraseña: 'rochi333'.
usuario3 := self agregarUsuarioConNombre: 'elUnicoGrande10' contraseña: '03-04-1905'.

usuario1 seguirA: usuario2.
usuario1 seguirA: usuario3.
usuario2 seguirA: usuario3.

usuario3 agregarTopicoDeInteres: top3.
usuario2 agregarTopicoDeInteres: top2.

usuario1 agregarPreguntaConTitulo: '¿Que es la POO?' descripcion: 'Me gustaria saber mas sobre el tema' topicos: topicos1.
usuario3 agregarPreguntaConTitulo: '¿Que es una pagina SPA?' descripcion: 'Quisiera apreder dicha forma de hacer paginas' topicos: topicos2.
pregunta1 := usuario3 agregarPreguntaConTitulo: '¿Which is your favorite programming language?' descripcion: 'Just for curiosity' topicos: topicos3.
usuario3 agregarPreguntaConTitulo: '¿Que es una API Rest?' descripcion: 'Quiero saber mas del asunto' topicos: topicos4.
pregunta2:= usuario2 agregarPreguntaConTitulo: '¿How many english speakers are in the community?' descripcion: 'Statistics' topicos: topicos6.
pregunta3:= usuario1 agregarPreguntaConTitulo: 'Que navegador es mejor para web dev?' descripcion: 'Chrome o Firefox?' topicos: topicos6.


pregunta1 agregarRespuestaConUsuario: usuario1 texto: 'Python <3 is my fav PL!'.
pregunta1 agregarRespuestaConUsuario: usuario2 texto: 'Javascript is the best!'.
pregunta2 agregarRespuestaConUsuario: usuario1 texto: 'I am an english speaker!'.
pregunta3 agregarRespuestaConUsuario: usuario3 texto: 'En mi opinion, google chrome es el mejor'.
pregunta3 agregarLikeDe: usuario3.


 
]

{ #category : #public }
CuOOra >> chequearExistenciaDeUsuarioConNombre: unNombre contraseña: unaContraseña [
^ (usuarios detect: [ :usuario | usuario cumploConNombre: unNombre contraseña: unaContraseña ] ifNone: [ ^ nil ]).

]

{ #category : #initialization }
CuOOra >> initialize [ 
"inicializo las colecciones"

usuarios := Set new.
topicos := Set new. 
]

{ #category : #testing }
CuOOra >> obtenerPreguntasDe: unUsuario [
"metodo pasamamos? esta demas?"
^ unUsuario preguntas.
]

{ #category : #public }
CuOOra >> obtenerPreguntasDeTopico: unTopico [

^ usuarios flatCollect: [ :usuario | usuario obtenerPreguntasDeTopico: unTopico ].
]

{ #category : #private }
CuOOra >> obtenerPreguntasDeTopicosDeInteresDe: unUsuario [
"obtiene las preguntas de itneres del usuario de acuerdo a los topicos de su interes"
^ (unUsuario topicosDeInteres flatCollect: [:topico | self obtenerPreguntasDeTopico: topico]).
]

{ #category : #public }
CuOOra >> obtenerPreguntasRelevantesDe: unUsuario [
"obtiene todas las preguntas que le interesan a un usuario." 
"Una especie de envidia de atributos? Es necesario hacerlo de esta forma porque el sistema puede llegar a todas las preguntas unicamente"
^ ((self obtenerPreguntasDeTopicosDeInteresDe: unUsuario) union: (unUsuario obtenerPreguntasDeSeguidos)asSet).

]

{ #category : #public }
CuOOra >> obtenerRespuestasDe: unUsuario [
"obtiene las respuestas de un usuario dado"

^ (usuarios flatCollect: [:usuario| usuario obtenerRespuestasDe:unUsuario]).
]

{ #category : #testing }
CuOOra >> obtenerRespuestasOrdenadasDe: unaPregunta [
"Devuele las respuestas ordenadas de unaPregunta"
"No seria como un pasamanos? O por el enunciado esta bien? Sino seria responsabilidad de la pregunta unicamente"

^ unaPregunta respuestasOrdenadas.
]

{ #category : #testing }
CuOOra >> topicos [

^ topicos
]

{ #category : #testing }
CuOOra >> usuarios [

^ usuarios.
]
