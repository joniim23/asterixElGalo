class Ingrediente {
	var property tamanio = 0
	
	method fuerza() 
	
	method resistencia() = 0
}

object dulceDeLeche inherits Ingrediente {
	override method fuerza() = 10
}

//Manojo y aceite son iguales
class ManojoOAceite inherits Ingrediente {
	override method fuerza() = tamanio
}

class ZumoDeZanahoria inherits Ingrediente {
	override method resistencia() = 1
}