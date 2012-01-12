package sieym

class ComponenteProducto {
	
	static belongsTo = Producto

    static constraints = {
    }
	
	MateriaPrima materiaPrima
	int porcentaje
}
