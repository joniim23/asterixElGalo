import ingredientes.*

class Pocion {
	var ingredientes = []
	var muerdagos = []
	
	method agregarMuerdago(muerdago) = muerdagos.add(muerdago) and ingredientes.add(muerdago) //Muerdago se agrega en otra coleccion porque tiene otro efecto
	method agregarIngrediente(ingrediente) = ingredientes.add ( ingrediente )
	
	method tieneDulceDeLeche() = ingredientes.contains(dulceDeLeche)

	method efecto(pj) {
		if( self.tieneDulceDeLeche() and !pj.estaVivo() ) {
			pj.estaVivo(true)
			pj.resistencia(2)
		}
		
		if( self.tieneMuchoMuerdago() ) {
			pj.resistencia( pj.resistencia() / 2 )
		}
		
		pj.sumarResistencia(self.resistenciaPocion())
		pj.sumarFuerza(self.fuerzaPocion())
	}
	
	method tieneMuchoMuerdago() = muerdagos.any{ muerdago => muerdago.tamanio() > 5}
	
	method fuerzaPocion() = ingredientes.sum { ingrediente => ingrediente.fuerza() }
	
	method resistenciaPocion() = ingredientes.sum { ingrediente => ingrediente.resistencia() }
	
}
