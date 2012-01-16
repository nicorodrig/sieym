package sieym

class Producto {
	
	static hasMany = [composicion: ComponenteProducto]

    static constraints = {
    }
	
	List composicion
	String nombre
	
	public float calcularCoeficienteProduccion(Fase fase) {
		composicion.collect({it.materiaPrima.coeficienteProduccion[fase.nombre].valor * (it.porcentaje / 100)}).sum()
	}
}
