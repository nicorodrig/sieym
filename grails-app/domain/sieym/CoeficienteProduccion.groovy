package sieym

class CoeficienteProduccion {
	
	static belongsTo = [materiaPrima: MateriaPrima]
	
	Fase fase
	float valor
}
