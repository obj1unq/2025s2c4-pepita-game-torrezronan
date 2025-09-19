import muros.*
import comidas.*
import wollok.game.*
import extras.*
import direcciones.*






object pepita {
	var property position = game.at(0,1) //
	var energia = 200
	const predador = silvestre
	const joules = 9
	const hogar = nido
	var property obstaculo = muroDos
	
	method text() = "Energia: \n" + energia
	method textColor() = "FF0000"

	
	method image(){
		// Devuelve una imagen para pepita dependiendo de su estado
        return "pepita-" + self.estado() + ".png"
    }

	method estado(){
		// Cambio de pepita si es atrapada o no se puede mover y si llega al nido sino sigue igual
		// El not se representa con "!" delante de la expresion booleana
		return if (self.esAtrapada() || !self.puedeMover()){ "gris" }
		    	else if (self.enHogar()){ "grande"  }
				else { "base" }
	}
	


	method esAtrapada() = self.estaSobre(predador)

	method estaSobre(alguien) = position == alguien.position()

	//

	method puedeMover() = energia >= self.energiaNecesaria(1) && not self.esAtrapada() 

	method energiaNecesaria(kms) = joules * kms

	//

	method enHogar() = self.estaSobre(hogar)

	

	

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia -= self.energiaNecesaria(kms) 
	}
	
	method energia() {
		return energia
	}

	//


	

	method perder(){
		game.say(self,"Perdí!")
		game.schedule( 2000, { game.stop() })
	}

	
	//

	method loQueHayAca() = game.uniqueCollider(self)

	method comerAca(){
		const comida = self.loQueHayAca()
		self.comer(comida)
		comida.andate()
	}

	//

	method moverCuadoPuede(direccion) {
		if(self.puedeMover()){self.volar(1)
			position = direccion.siguiente(position)}
		else {self.perder()}
	}
	
	method mover(direccion) {
		const personaje = self
		const nuevaPosicion = direccion.siguiente( personaje.position() )
		
		if(nuevaPosicion.x()< game.width() && nuevaPosicion.x() >= 0 && nuevaPosicion.y()< game.height() && nuevaPosicion.y() >= 0 && not self.hayCajaProximaPosicion(direccion)   )
			self.moverCuadoPuede(direccion)
		}

		//Para tener en cuenta la nueva posicion se compara con el numero de identificacion de la celda que arranca de 0 a N no con el numero de celda que va de 1 a N 
	

	method caete() {
		const direccion = abajo
		
		const nuevaPosicion = direccion.siguiente( position )
		
		if(nuevaPosicion.x()< game.width() && nuevaPosicion.x() >= 0 && nuevaPosicion.y()< game.height() && nuevaPosicion.y() >= 0 && self.puedeMover() && not self.hayCajaProximaPosicion(direccion)   )
			position = direccion.siguiente(position)
		
	}


	method hayCajaProximaPosicion(direccion) {
		
		return direccion.siguiente(position) == obstaculo.position()
	} 
}








