import wollok.game.*
import direcciones.*
import pepita.*



object muroUno {

    const enemigo = pepita
    const property position = game.center().up(1)
    

    method image() = "muro.png"

    

    

    


    method hayEnemigoIzquierda() =  izquierda.siguiente(position) == enemigo.position()

    method hayEnemigoDerecha() =  derecha.siguiente(position) == enemigo.position()

    method hayEnemigoArriba() =  arriba.siguiente(position) == enemigo.position()

    method hayEnemigoAbajo() =  abajo.siguiente(position) == enemigo.position()
}


object muroDos {
    const enemigo = pepita
    const property position = game.center()
    

    method image() = "muro.png" 

    

    
//self.hayEnemigoAbajo()||self.hayEnemigoArriba()||self.hayEnemigoDerecha()||self.hayEnemigoIzquierda()



    method hayEnemigoIzquierda() =  izquierda.siguiente(Position) == enemigo.position()

    method hayEnemigoDerecha() =  derecha.siguiente(Position) == enemigo.position()

    method hayEnemigoArriba() =  arriba.siguiente(Position) == enemigo.position()

    method hayEnemigoAbajo() =  abajo.siguiente(Position) == enemigo.position()
}