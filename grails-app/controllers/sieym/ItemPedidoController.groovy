package sieym

import org.springframework.dao.DataIntegrityViolationException

class ItemPedidoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list() {
        Pedido pedido = Pedido.get(params.id)
        [itemPedidoInstanceList: pedido.items, itemPedidoInstanceTotal: pedido.items.size()]
    }

    def create() {
        [itemPedidoInstance: new ItemPedido(params)]
    }

    def save() {
        Pedido pedido = Pedido.get(params.pedidoId)
        def itemPedidoInstance = new ItemPedido(params)
		pedido.items.add itemPedidoInstance
        if (!pedido.save(flush: true)) {
            render(view: "create", model: [itemPedidoInstance: itemPedidoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), itemPedidoInstance.id])
        redirect(action: "show", id: itemPedidoInstance.id, params: [pedidoId: params.pedidoId])
    }

    def show() {
        def itemPedidoInstance = ItemPedido.get(params.id)
        if (!itemPedidoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), params.id])
            redirect(action: "list")
            return
        }

        [itemPedidoInstance: itemPedidoInstance]
    }

    def edit() {
        def itemPedidoInstance = ItemPedido.get(params.id)
        if (!itemPedidoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), params.id])
            redirect(action: "list")
            return
        }

        [itemPedidoInstance: itemPedidoInstance]
    }

    def update() {
        def itemPedidoInstance = ItemPedido.get(params.id)
        if (!itemPedidoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (itemPedidoInstance.version > version) {
                itemPedidoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'itemPedido.label', default: 'ItemPedido')] as Object[],
                          "Another user has updated this ItemPedido while you were editing")
                render(view: "edit", model: [itemPedidoInstance: itemPedidoInstance])
                return
            }
        }

        itemPedidoInstance.properties = params

        if (!itemPedidoInstance.save(flush: true)) {
            render(view: "edit", model: [itemPedidoInstance: itemPedidoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), itemPedidoInstance.id])
        redirect(action: "show", id: itemPedidoInstance.id, params: [pedidoId: params.pedidoId])
    }

    def delete() {
        Pedido pedido = Pedido.get(params.pedidoId)
        def itemPedidoInstance = ItemPedido.get(params.id)
        if (!itemPedidoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), params.id])
            redirect(action: "list")
            return
        }

        try {
			pedido.items.remove(itemPedidoInstance)
			pedido.save(flush: true)
            itemPedidoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), params.id])
            redirect(action: "list", id: params.pedidoId)
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'itemPedido.label', default: 'ItemPedido'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
