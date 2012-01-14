package sieym

class ItemPedido {
		
	static belongsTo = Pedido

	Producto producto
	Paquete paquete
	Integer cantidad
}
