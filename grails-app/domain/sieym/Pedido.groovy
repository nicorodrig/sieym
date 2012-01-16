package sieym

class Pedido {

    static constraints = {
		fechaEntrega nullable: true
		motivoRechazo nullable: true
		motivoCancelado nullable: true
		seña min: 150d, nullable: true
    }
	
	static hasMany = [items: ItemPedido]
	
	User cliente
	EstadoPedido estado
	Date fechaPedido
	Date fechaEntrega
	String direccionEntrega
	Double seña
	String motivoRechazo
	String motivoCancelado
	boolean recibirAvisos
	List items

	public float calcularCoeficienteProduccion(Fase fase) {
    	println items.collect({it.producto.calcularCoeficienteProduccion(fase)})
		items.collect({it.producto.calcularCoeficienteProduccion(fase)}).sum()
	}
	
	public float calcularDuracion(Maquina mq){
		float d = mq.fase.duracion * mq.rendimiento * this.calcularCoeficienteProduccion(mq.fase)
		d.trunc(2)
	}
}
