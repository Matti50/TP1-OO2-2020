Class {
	#name : #CuooraSampleLoader,
	#superclass : #Object,
	#category : #'TP1-samples'
}

{ #category : #public }
CuooraSampleLoader >> loadSampleDataIn: aCuoora [

|pedro diego juan topic1 topic2 topic3 preguntaDePedro preguntaDeDiego|

topic1 := aCuoora agregarTopicoConNombre: 'OO1' descripcion: 'Dedicado a la materia de orientacion a objetos 1'.
topic2 := aCuoora agregarTopicoConNombre: 'Test de Unidad' descripcion: 'Para comprender como hacer mejores test'.
topic3 := aCuoora agregarTopicoConNombre: 'Smalltalk' descripcion: 'Dedicado al mejor lenguaje orientado a objetos'.


pedro :=  aCuoora agregarUsuarioConNombre: 'pedro@cuoora.com' contraseña: 'pedro@cuoora.com'.
diego := aCuoora agregarUsuarioConNombre: 'diego@cuoora.com' contraseña: 'diego@cuoora.com'.
juan := aCuoora agregarUsuarioConNombre: 'juan@cuoora.com' contraseña: 'juan@cuoora.com'.



preguntaDePedro :=  pedro agregarPreguntaConTitulo: '¿Para que sirve el metodo setUp?' descripcion: 'Me gustaria saber mas del tema' topicos: (Set new add: topic1; add: topic2;yourself).

preguntaDePedro agregarRespuestaConUsuario: diego texto: 'Sirve para instanciar los objetos que
son evaluados por el test en un único método y que se
ejecute siempre antes de cada test.'.

preguntaDeDiego := diego agregarPreguntaConTitulo: '¿Que significa #messageNotUnderstood?' descripcion: 'Tengo este error' topicos: (Set new add: topic1; add: topic3;yourself).

preguntaDeDiego agregarRespuestaConUsuario: pedro texto: ' Significa que el objeto que recibió el
mensaje no encontró ningún método para ejecutar en
respuesta.'.

juan seguirA: diego.
pedro seguirA: juan.


^ aCuoora.



]
