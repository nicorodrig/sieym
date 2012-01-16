package sieym

import static org.junit.Assert.*

import sieym.ComponenteProducto;
import sieym.MateriaPrima;

class PedidioTests {
	private static TestData DATA = new TestData()

	void testCalcularCoeficienteProduccion() {
		def (Fase sapecado, Fase canchado, Fase molienda) = DATA.createFases()
		Pedido pedido = DATA.createPedido()

		assert pedido.calcularCoeficienteProduccion(sapecado) == 25.89F
		assert pedido.calcularCoeficienteProduccion(canchado) == 49.96F
		assert pedido.calcularCoeficienteProduccion(molienda) == 37.35F
	}

	void testCalcularDuracion() {
		def (Fase sapecado, Fase canchado, Fase molienda) = DATA.createFases()
		Pedido pedido = DATA.createPedido()
		def (Maquina mq1, Maquina mq2, Maquina mq3, Maquina mq4) = DATA.createMaquinas()[sapecado]

		assert pedido.calcularDuracion(mq2) == 167.76F
		assert pedido.calcularDuracion(mq3) == 191.06F
		assert pedido.calcularDuracion(mq4) == 160.77F
	}
}
