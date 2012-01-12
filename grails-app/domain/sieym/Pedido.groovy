package sieym

class Pedido {

    static constraints = {
		fechaEntrega nullable: true
		motivoRechazo nullable: true
		motivoCancelado nullable: true
		seña min: 150d, nullable: true
    }
	
	User cliente
	Producto producto
	Paquete paquete
	Integer cantidad
	EstadoPedido estado
	Date fechaPedido
	Date fechaEntrega
	String direccionEntrega
	boolean recibirAvisos
	Double seña
	String motivoRechazo
	String motivoCancelado
}
