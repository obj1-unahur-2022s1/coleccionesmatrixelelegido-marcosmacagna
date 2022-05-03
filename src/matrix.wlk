object neo {
	var energia = 100
	
	method energia() = energia
	method saltar() {energia *= 0.5}
	method vitalidad() = energia/10
	method esElElegido() = true
}

object morfeo {
	var property vitalidad = 8
	var estaCansado = false
	
	method saltar() {
		estaCansado = not estaCansado 
		vitalidad = 0.max(vitalidad - 1)	
	}
	method esElElegido() = false
	method estaCansado() = estaCansado
}

object trinity {
	method saltar(){}
	method vitalidad() = 0
	method esElElegido() = false
}

object nave {
	var pasajeros = [neo,morfeo,trinity]
	
	method pasajeros() = pasajeros.size()
	method pasajeroConMayorVitalidad() = pasajeros.max( { p => p.vitalidad() } )
	method pasajeroConMenorVitalidad() = pasajeros.min( { p => p.vitalidad() } )
	method estaEquilibrada() {
		return self.pasajeroConMayorVitalidad().vitalidad() < self.pasajeroConMenorVitalidad().vitalidad() * 2
	}
	method elElegidoEstaEnLaNave() = pasajeros.any( { p => p.esElElegido() } )
	method chocar(){
		pasajeros.forEach( { p => p.saltar() } )
		pasajeros.clear()
	}
	method noElegidos() = pasajeros.filter( { p => not p.esElElegido() } )
	method acelerar() = self.noElegidos().forEach( { p => p.saltar() } )
}