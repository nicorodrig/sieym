package sieym

class Camion {

    static constraints = {
    }
	
	static belongsTo = Logistica
	
	String marca
	String modelo
	String patente
	String chofer
	boolean disponible
	
}
