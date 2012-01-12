package sieym

class Producto {
	
	static hasMany = [composicion: ComponenteProducto]

    static constraints = {
    }
	
	String nombre
}
