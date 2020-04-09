Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'userName',
		'userPass'
	],
	#category : #'TP1-ui'
}

{ #category : #'class initialization' }
LoginComponent class >> initialize [

(WAAdmin register: self asApplicationAt: 'cuoora') sessionClass: CuooraSession.
]

{ #category : #callback }
LoginComponent >> chequearUsuarioYLoggear [

((CuOOra soleInstance) chequearExistenciaDeUsuarioConNombre: (self userName) contraseña: (self userPass))
ifNotNil: [ :user| 
		self session user: user.
		self call: HomeComponent new. 
	].
userName := nil.
userPass:= nil.
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
		
		aCanvas button callback:[self chequearUsuarioYLoggear ]; with: 'Iniciar Sesion' .
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
