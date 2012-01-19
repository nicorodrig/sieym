package sieym

import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;
import org.joda.time.Interval;
import org.joda.time.Years;

class Maquina {

	static hasMany = [reservas: ReservaMaquina]

	String descripcion
	Fase fase
	int capacidad
	float rendimiento
	int temperatura

	public List<Interval> verificarDisponibilidad() {
		// no hay reservas, cualquier intervalo esta disponible
		if(!this.reservas) return null
		List<Interval> sorted = this.reservas.sort({it.intervalo.start})
		DateTime now = new DateTime();
		List<Interval> disponibilidad = [new Interval(now, sorted.first().intervalo.start)]
		def prevEnd = sorted.first().intervalo.end
		disponibilidad += sorted.tail().collect(
				{
					new Interval(prevEnd, it.intervalo.start)
					prevEnd = it.intervalo.end
				})
		disponibilidad += new Interval(prevEnd, Years.ONE)
	}

	public static List<List<Maquina>> agrupar(List maquinas, float pesoPedido) {
		def cap = {def mq -> mq.capacidad}
		maquinas.sort {-cap(it)}
		def grupos = [] as Set
		for(Maquina mq1 : maquinas) {
			def grupo = [mq1] as Set
			int capacidad = mq1.capacidad
			for(Maquina mq2 : maquinas) {
				if(mq1 == mq2) continue
					grupo.add mq2
				capacidad += mq2.capacidad
				if(capacidad >= pesoPedido) {
					grupos.add grupo
					grupo = [mq1] as Set
					capacidad = mq1.capacidad
				}
			}
		}
		return grupos.collect({it.sort(cap)}).sort {it.sum(cap)}
	}

	public String toString() {
		return "${this.descripcion}(${this.capacidad}Tn)"
	}
}
