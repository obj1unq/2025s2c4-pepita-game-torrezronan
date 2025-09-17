import wollok.game.*
import pepita.*
import limites.*


object arriba{
    method siguiente(posicion) = posicion.up(1)
    method numeroGuia() = 1
}

object abajo{
    method siguiente(posicion) = posicion.down(1)
    method numeroGuia() = 2 
}

object derecha{
    method siguiente(posicion) = posicion.right(1)
    method numeroGuia() = 3
}

object izquierda{
    method siguiente(posicion) = posicion.left(1)
    method numeroGuia() = 4

}


//method mover(direccion){
		////self.volar(1)
			//position = direccion.siguiente(position)
		//} else {
			//self.perder()
		//}
	//}