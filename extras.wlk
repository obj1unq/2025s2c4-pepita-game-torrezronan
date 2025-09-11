
import wollok.game.*
import pepita.*

object nido{
    const property position = game.at(8, 8)

    method image() = "nido.png"

}

object silvestre{
    const presa = pepita

    method image() = "silvestre.png"


    // Define la posicion en cada instante de silvestre en cero en Y y la X depende de la ubicacion de pepita en cada instante

    method position() = game.at(self.x(), 0)

    // Devuelve la posicion en x de pepita, por defecto inicia en 3 y cambia cuando la posicion de pepita es mayor a 3

    method x() = 3.max(presa.position().x())  // Es lo mismo hacer -->>presa.position().x().max(3)  

    // Usamos .max() pero es lo mismo hacer -->> if(presa.position().x() >= 3) { presa.position().x()} else { 3 }

}

