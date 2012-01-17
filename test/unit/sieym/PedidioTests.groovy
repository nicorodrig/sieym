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
		assert pedido.calcularDuracion([mq1, mq4]) == 160.77F
	}

	void testCalcularPesoTotal() {
		Pedido pedido = DATA.createPedido()
		assert pedido.calcularPesoTotal() == 102F
	}

	void testCalcularPesoTotalConSobrantes() {
		def (Producto pA, Producto pB) = DATA.createProductos();
		Map sobrantes = [(pA): 12]
		Pedido pedido = DATA.createPedido()

		assert pedido.calcularPesoTotal(sobrantes) == 90F
		sobrantes.put(pB, 5)
		assert pedido.calcularPesoTotal(sobrantes) == 85F
	}

	void testGenerarAlternativasProduccion() {
		def (Fase sapecado, Fase canchado, Fase molienda) = DATA.createFases()
		def (Producto pA, Producto pB) = DATA.createProductos();
		Map sobrantes = [(pA): 12, (pB): 5]
		Pedido pedido = DATA.createPedido()
		List mqs = DATA.createMaquinas()[sapecado]
		def (Maquina mq1, Maquina mq2, Maquina mq3, Maquina mq4) = mqs

		def alternativas = [
			[maquinas: [mq4, mq1], duracion: 160.77F],
			[maquinas: [mq2], duracion: 167.76F],
			[maquinas: [mq3], duracion: 191.06F],
		]
		assert alternativas == pedido.generarAlternativasProduccion(mqs, sobrantes)
	}
}
