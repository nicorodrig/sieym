import sieym.MateriaPrima;

import sieym.ComponenteProducto;
import sieym.EstadoPedido;
import sieym.ItemPedido;
import sieym.Logistica;
import sieym.MateriaPrima;
import sieym.Pedido;
import sieym.Producto;
import sieym.Role;
import sieym.Paquete;

import sieym.User

class BootStrap {

	def init = { servletContext ->
		User user = new User(
				name: "Admin User",
				dni: 66666666,
				username: "admin",
				email: "admin@sieym.com",
				phone: "4555-5555",
				address: "Street 1000",
				password: "shhhh",
				active: true,
				role: Role.ADMIN
				)
		user.save()
		println user.errors
		user = new User(
				name: "Regular User",
				dni: 555555555,
				username: "user",
				email: "user@sieym.com",
				phone: "4555-4444",
				address: "Street 2000",
				password: "hola",
				active: true,
				role: Role.USER
				)
		user.save()
		new Logistica(precioPorKm: 250, tiempoPorKm: 1.5).save()
		MateriaPrima sal = new MateriaPrima(nombre: 'Sal', descripcion: 'Para salar').save()
		MateriaPrima pimienta = new MateriaPrima(nombre: 'Pimienta', descripcion: 'Para pimentar').save()
		Producto p = new Producto(nombre: 'Sal y Pimienta')
		p.addToComposicion(new ComponenteProducto(materiaPrima: sal, porcentaje: 60))
		p.addToComposicion(new ComponenteProducto(materiaPrima: pimienta, porcentaje: 40))
		p.save()
		Paquete paq = new Paquete(name: "A", descripcion: "Paquete tipo A", capacidad: 23, tiempoArmado: 30)
		paq.save()
		EstadoPedido.values()[0..3].each { def ep ->
			2.times { def time ->
				def items = [new ItemPedido(producto: p, paquete: paq, cantidad: 5 * (1 + time) * (1 + ep.ordinal()))]
				Pedido ped = new Pedido(cliente: user, items: items, estado: ep, fechaPedido: new Date(), direccionEntrega: "Pichincha 1234")
				ped.save()
				println ped.errors
			}
		}
	}
	def destroy = {
	}
}
