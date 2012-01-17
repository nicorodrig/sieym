package sieym

import static org.junit.Assert.*

class MaquinaTests {

	public void testAgrupar() {
		Fase sapecado = new Fase(nombre: "Sapecado", duracion: 9)
		Maquina mq80 = new Maquina(descripcion: "MQ1", fase: sapecado, capacidad: 80, rendimiento: 0.6)
		Maquina mq180 = new Maquina(descripcion: "MQ2", fase: sapecado, capacidad: 180, rendimiento: 0.72)
		Maquina mq240 = new Maquina(descripcion: "MQ3", fase: sapecado, capacidad: 240, rendimiento: 0.82)
		Maquina mq90 = new Maquina(descripcion: "MQ4", fase: sapecado, capacidad: 90, rendimiento: 0.69)
		Maquina mq70 = new Maquina(descripcion: "MQ5", fase: sapecado, capacidad: 70, rendimiento: 0.69)

		List l1 = [mq80, mq90, mq70]
		List l2 = [mq80, mq180, mq90, mq70]

		def g1 = [[mq70, mq80], [mq70, mq90], [mq80, mq90]]
		def g2 = [[mq70, mq80, mq90], [mq70, mq180], [mq80, mq180], [mq90, mq180]]

		assert g1 == Maquina.agrupar(l1, 100)
		assert g2 == Maquina.agrupar(l2, 200)
	}
}
