Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'userName',
		'userPass'
	],
	#category : #'TP1-ui'
}

{ #category : #'class initialization' }
LoginComponent class >> initialize [

WAAdmin register: self asApplicationAt: 'cuoora-iniSesion'.
]

{ #category : #private }
LoginComponent >> chequearUsuarioYLoggear [
|user|
user := cuoora chequearExistenciaDeUsuarioConNombre: (self userName) contraseña: (self userPass).
user ifNotNil: [ self call: (HomeComponent user: user network: cuoora)  ].

]

{ #category : #initialization }
LoginComponent >> initialize [
super initialize.

cuoora := CuOOra cargada.


]

{ #category : #rendering }
LoginComponent >> renderContentOn: aCanvas [

aCanvas heading with: 'CuOOra'.
aCanvas form: [ 
		aCanvas paragraph:[aCanvas label with: 'Nombre de Usuario:'. aCanvas space.
			aCanvas textInput on: #userName of: self.
	 	].
		aCanvas paragraph: [ aCanvas label with: 'Contraseña:'. aCanvas space.
			aCanvas textInput on: #userPass of: self].
		
		aCanvas button callback:[self chequearUsuarioYLoggear ]; with: 'Ir al home' .
].

aCanvas unorderedList: [ 
		cuoora usuarios do: [ :each | aCanvas listItem with: each nombreDeUsuario , ' ', each contraseña ] 
	
	 ].

"aCanvas anchor:[ aCanvas button callback: [ self halt. ]; with: 'Hola botton']."
"Es raro como los botones no hacen la accion por defecto si no estan en un form"
]

{ #category : #accessing }
LoginComponent >> userName [
^ userName

]

{ #category : #accessing }
LoginComponent >> userName: anUserName [

userName := anUserName.
]

{ #category : #accessing }
LoginComponent >> userPass [ 
^ userPass.
]

{ #category : #accessing }
LoginComponent >> userPass: anUserPass [

userPass := anUserPass.
]
