class Persona {
	var property fuerza = 0
	var property resistencia = 0
	var property bando //puede ser "galo" o "romano"
	var property estaVivo = true
	
	method poder() = fuerza * resistencia
	
	method recibeDanio(danio) {
		if (danio < resistencia) resistencia - danio
		else {
			estaVivo = false
			resistencia = 0
		}
	}
	
	method tomarPocion (pocion) {
		if (pocion.tieneDulceDeLeche() and !estaVivo) {
			estaVivo = true
			resistencia = 2
		}
		
		if ( pocion.tieneMuerdago() and pocion.tieneMuchoMuerdago() ){
			resistencia /= 2
		}
		
		fuerza = pocion.fuerzaPocion()
		resistencia = pocion.resistenciaPocion()
	}
	
	method atacarA(victima) = victima.recibeDanio(self.poder())
	
}

class Aldea {
	var soldados = []
	
	method soldadosVivos() = soldados.filter { soldado => soldado.estaVivo() }
	method poderDeAtaque() = self.soldadosVivos().sum { soldado => soldado.poder() }
	
	method recibirDanio(atacante) {
		self.soldadosVivos().forEach { soldado => soldado.recibeDanio( self.danioDeAtacantePorSoldado(atacante) ) }
	}
	method danioDeAtacantePorSoldado(atacante) = atacante.poder() / self.soldadosVivos()
	
	method atacarA(victima) {
		victima.recibeDanio(self.poderDeAtaque())
		self.soldadoMenosPoderoso().recibeDanio(self.diferenciaDePoderCon(victima))	
	}
	
	method soldadoMenosPoderoso() = self.soldadosVivos().min{ soldado => soldado.poder() }
	method diferenciaDePoderCon(victima) = (victima.poder() - self.soldadoMenosPoderoso().poder()).abs()
}

class Campamento inherits Aldea {
	var property formaDeAtacar
	
	override method poderDeAtaque() = formaDeAtacar.poderDeAtaque(self)
	
	override method recibirDanio(atacante) {
		formaDeAtacar.recibirDanio(atacante, self)
	}
}

object ataqueTortuga {
	method poderDeAtaque(campamento) = campamento.soldadosVivos().max { soldado => soldado.poder() }
	
	method recibirDanio(atacante, campamento) = campamento.soldadosVivos().forEach{ soldado => soldado.recibeDanio( campamento.danioDeAtacantePorSoldado(atacante) / 2 )}
}

object ataqueCuadro {
	method poderDeAtaque(campamento) = campamento.soldadosVivos().sum { soldado => soldado.poder() * 2}
	
	method recibirDanio(atacante, campamento) = campamento.soldadosVivos().forEach { soldado => soldado.recibeDanio( campamento.danioDeAtacantePorSoldado(atacante) ) }
}