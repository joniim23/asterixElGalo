import ingredientes.*

class Pocion {
	var ingredientes = []
	
	method agregarIngrediente(ingrediente) = ingredientes.add ( ingrediente )
	
	method tieneDulceDeLeche() = ingredientes.contains(dulceDeLeche)
	
	method tieneMuerdago() =  ingredientes.contains(manojoDeMuerdago)
	method tieneMuchoMuerdago() = manojoDeMuerdago.tamanioManojo() > 5
	
	
	method fuerzaPocion() = ingredientes.sum { ingrediente => ingrediente.fuerza() }
	
	method resistenciaPocion() = ingredientes.sum { ingrediente => ingrediente.resistencia() }
	
}
