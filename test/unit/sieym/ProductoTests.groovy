package sieym

import static org.junit.Assert.*

import sieym.ComponenteProducto;
import sieym.MateriaPrima;

class ProductoTests {
	private static TestData DATA = new TestData()

	void testCalcularCoeficienteProduccion() {
		def (Fase sapecado, Fase canchado, Fase molienda) = DATA.createFases()
		def (Producto pA, Producto pB) = DATA.createProductos()

		assert pA.calcularCoeficienteProduccion(sapecado) == 13.85F
		assert pA.calcularCoeficienteProduccion(canchado) == 23.0F
		assert pA.calcularCoeficienteProduccion(molienda) == 23.55F

		assert pB.calcularCoeficienteProduccion(sapecado) == 12.04F
		assert pB.calcularCoeficienteProduccion(canchado) == 26.96F
		assert pB.calcularCoeficienteProduccion(molienda) == 13.8F
	}

}
