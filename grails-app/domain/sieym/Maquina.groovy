package sieym

import java.util.List;

class Maquina {

	String descripcion
	Fase fase
	int capacidad
	float rendimiento
	int temperatura

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
