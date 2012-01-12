package sieym

class Logistica {

    static constraints = {
    }
	
	static hasMany = [camiones: Camion]
	
	Double precioPorKm
	Double tiempoPorKm
	
}
