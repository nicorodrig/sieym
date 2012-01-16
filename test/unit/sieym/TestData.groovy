package sieym

class TestData {

	List fases
	List productos
	List paquetes
	Pedido pedido
	Map maquinas

	public List createFases() {
		if(!this.fases){
			Fase sapecado = new Fase(nombre: "Sapecado", duracion: 9)
			Fase canchado = new Fase(nombre: "Canchado", duracion: 10)
			Fase molienda = new Fase(nombre: "Molienda", duracion: 10)
			this.fases = [sapecado, canchado, molienda]
		}
		return this.fases
	}

	public Map createMaquinas() {
		if(!this.maquinas){
			def (Fase sapecado, Fase canchado, Fase molienda) = this.createFases()
			Maquina mq1 = new Maquina(descripcion: "MQ1", fase: sapecado, capacidad: 60, rendimiento: 0.6)
			Maquina mq2 = new Maquina(descripcion: "MQ2", fase: sapecado, capacidad: 180, rendimiento: 0.72)
			Maquina mq3 = new Maquina(descripcion: "MQ3", fase: sapecado, capacidad: 240, rendimiento: 0.82)
			Maquina mq4 = new Maquina(descripcion: "MQ4", fase: sapecado, capacidad: 100, rendimiento: 0.69)
			this.maquinas = [(sapecado): [mq1, mq2, mq3, mq4]]
		}
		return this.maquinas
	}
	
	public List createProductos() {
		if(!this.productos) {
			this.createFases()
			MateriaPrima mp1 = this.createMateriaPrima("MP1", [12, 25, 32])
			MateriaPrima mp2 = this.createMateriaPrima("MP2", [13, 26, 9])
			MateriaPrima mp3 = this.createMateriaPrima("MP3", [15, 21, 25])
			MateriaPrima mp4 = this.createMateriaPrima("MP4", [11, 28, 19])

			Producto pA = new Producto(nombre: "Producto A", composicion:
					[
						new ComponenteProducto(porcentaje: 25, materiaPrima: mp1),
						new ComponenteProducto(porcentaje: 20, materiaPrima: mp2),
						new ComponenteProducto(porcentaje: 55, materiaPrima: mp3)
					])

			Producto pB = new Producto(nombre: "Producto B", composicion:
					[
						new ComponenteProducto(porcentaje: 52, materiaPrima: mp2),
						new ComponenteProducto(porcentaje: 48, materiaPrima: mp4)
					])
			this.productos = [pA, pB]
		}
		return this.productos
	}
	
	public Pedido createPedido() {
		if(!this.pedido){
			this.createProductos()
			Paquete paq3 = new Paquete(name: "3 Tn", capacidad: 3)
			Paquete paq5 = new Paquete(name: "5 Tn", capacidad: 5)
			
			this.pedido = new Pedido()
			this.pedido.items = [
			                new ItemPedido(producto: this.productos[0], paquete: paq3, cantidad: 24),
			                new ItemPedido(producto: this.productos[1], paquete: paq5, cantidad: 6)
			                ]
		}
		return this.pedido
	}
	
	private MateriaPrima createMateriaPrima(String nombre, List cpValues) {
		Map cp = [(this.fases[0].nombre): new CoeficienteProduccion(fase: this.fases[0], valor: cpValues[0]),
			(this.fases[1].nombre): new CoeficienteProduccion(fase: this.fases[1], valor: cpValues[1]),
			(this.fases[2].nombre): new CoeficienteProduccion(fase: this.fases[2], valor: cpValues[2])]
		MateriaPrima mp = new MateriaPrima(nombre: nombre)
		mp.coeficienteProduccion = cp
		return mp
	}

}
