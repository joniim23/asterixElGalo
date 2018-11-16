object dulceDeLeche {
	method fuerza() = 10
	
	method resistencia() = 0
}

object manojoDeMuerdago {
	var property tamanioManojo = 0
	
	method fuerza() = tamanioManojo
	
	method resistencia() = 0
}

object aceiteDeRoca {
	var property dosis = 0 /* en cm3 */
	
	method fuerza() = dosis
	
	method resistencia() = 0
}

object zumoDeZanahoria {
	var property dosis = 0 /* en cm3 */
	
	method fuerza() = dosis
	
	method resistencia() = 1
}