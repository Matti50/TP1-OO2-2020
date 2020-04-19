Class {
	#name : #VotoTest,
	#superclass : #TestCase,
	#instVars : [
		'voto',
		'user'
	],
	#category : #'TP1-tests'
}

{ #category : #running }
VotoTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
user := Usuario newConNombreDeUsuario: 'Rocio' contraseña: 'rochilp123'.
voto := Voto newConUsuario: user.
]

{ #category : #tests }
VotoTest >> testMiAutorEs [

self assert: (voto miAutorEs: user).
self deny: (voto miAutorEs: (Usuario newConNombreDeUsuario: 'Gina gomez' contraseña: '124')).
]
