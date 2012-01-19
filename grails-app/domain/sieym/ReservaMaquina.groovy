package sieym

import org.joda.time.Interval;

class ReservaMaquina {
	
	static belongsTo = Maquina

	Pedido pedido
	Interval intervalo
	
}
