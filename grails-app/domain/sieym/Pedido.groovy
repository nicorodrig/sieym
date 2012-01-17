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
		items.sum({it.producto.calcularCoeficienteProduccion(fase)})
	}
	
	public float calcularDuracion(Maquina mq){
		float d = mq.fase.duracion * mq.rendimiento * this.calcularCoeficienteProduccion(mq.fase)
		d.trunc(2)
	}
	
	public float calcularDuracion(List<Maquina> mqs){
		mqs.collect({calcularDuracion it}).max()
	}
	
	public float calcularPesoTotal(){
		this.items.sum({it.paquete.capacidad * it.cantidad})
	}
	
	public float calcularPesoTotal(Map sobrantes){
		this.items.sum({ (it.paquete.capacidad * it.cantidad) - (sobrantes[it.producto] ?: 0) })
	}
	
	public def generarAlternativasProduccion(List maquinas, Map sobrantes) {
		float peso = this.calcularPesoTotal(sobrantes);
		def simples = maquinas.findAll({it.capacidad >= peso})
		def compuestas = Maquina.agrupar(maquinas.findAll({it.capacidad < peso}), peso)
		(simples.collect({[it]}) + compuestas).collect({[maquinas: it, duracion: calcularDuracion(it)]}).sort({it.duracion})
	}
	
}
