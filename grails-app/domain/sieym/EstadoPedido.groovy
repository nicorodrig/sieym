package sieym;

public enum EstadoPedido {
	Solicitado,
	Aceptado,
	Señado,
	Planificado,
	Produccion,
	Embolsado,
	EnViaje,
	Entregado,
	Rechazado,
	Cancelado
	
	public static List valuesFor(EstadoPedido ep) {
		def values = [ep]
		values.add Cancelado
		if(ep == Aceptado) {
			values.add Solicitado
		}
		return values
	}
}
