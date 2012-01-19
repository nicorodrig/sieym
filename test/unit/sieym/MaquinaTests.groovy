package sieym

import static org.junit.Assert.*
import grails.test.mixin.*

import org.joda.time.DateTime
import org.joda.time.Days
import org.joda.time.Hours
import org.joda.time.Interval

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

	public void testVerificarDisponibilidad() {
		DateTime now = new DateTime()
		DateTime tomorrow = now.plusDays(1).minusHours(5)
		DateTime otherDay = tomorrow.plusDays(4).minusHours(10)
		Interval int1 = new Interval(tomorrow, Hours.hours(12))
		Interval int2 = new Interval(otherDay, Days.days(3))
		List reservas = [new ReservaMaquina(intervalo: int1), new ReservaMaquina(intervalo: int2)]

		Maquina mqSinReservas = new Maquina()
		assert null == mqSinReservas.verificarDisponibilidad()

		Maquina mqUnaReserva = new Maquina(reservas: [reservas[0]])
		assert 2 == mqUnaReserva.verificarDisponibilidad().size()
		
		Maquina mqVariasReservas = new Maquina(reservas: reservas)
		assert 3 == mqVariasReservas.verificarDisponibilidad().size()
	}

}
