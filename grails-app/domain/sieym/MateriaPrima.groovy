package sieym

class MateriaPrima {

    static constraints = {
		coeficienteProduccion nullable: true
    }

//	static hasMany = [coeficienteProduccion: CoeficienteProduccion]

	Map coeficienteProduccion
	String nombre
	String descripcion

	public String toString() {
		nombre
	}
}
