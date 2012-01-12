package sieym

import org.springframework.dao.DataIntegrityViolationException

class ComponenteProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    def index() {
        redirect(action: "create", params: params)
    }

    def create() {
        [componenteProductoInstance: new ComponenteProducto(params), productoId: params.productoId]
    }

    def save() {
        def productoInstance = Producto.get(params.productoId)
        def componenteProductoInstance = new ComponenteProducto(params)
		productoInstance.addToComposicion(componenteProductoInstance)
        if (!productoInstance.save(flush: true)) {
            render(view: "create", model: [componenteProductoInstance: componenteProductoInstance, productoId: params.productoId])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'componenteProducto.label', default: 'ComponenteProducto'), componenteProductoInstance.id])
        redirect(controller: "producto", action: "show", id: productoInstance.id)
    }

    def edit() {
        def componenteProductoInstance = ComponenteProducto.get(params.id)
        if (!componenteProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'componenteProducto.label', default: 'ComponenteProducto'), params.id])
            redirect(action: "_list")
            return
        }

        [componenteProductoInstance: componenteProductoInstance, productoId: params.productoId]
    }

    def update() {
        def componenteProductoInstance = ComponenteProducto.get(params.id)
        if (!componenteProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'componenteProducto.label', default: 'ComponenteProducto'), params.id])
            redirect(action: "_list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (componenteProductoInstance.version > version) {
                componenteProductoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'componenteProducto.label', default: 'ComponenteProducto')] as Object[],
                          "Another user has updated this ComponenteProducto while you were editing")
                render(view: "edit", model: [componenteProductoInstance: componenteProductoInstance])
                return
            }
        }

        componenteProductoInstance.properties = params

        if (!componenteProductoInstance.save(flush: true)) {
            render(view: "edit", model: [componenteProductoInstance: componenteProductoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'componenteProducto.label', default: 'ComponenteProducto'), componenteProductoInstance.id])
        redirect(controller: "producto", action: "show", id: params.productoId)
    }

    def delete() {
        def productoInstance = Producto.get(params.productoId)
        def componenteProductoInstance = ComponenteProducto.get(params.id)
        if (!componenteProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'componenteProducto.label', default: 'ComponenteProducto'), params.id])
            redirect(controller: "producto", action: "show", id: params.productoId)
            return
        }

        try {
			productoInstance.removeFromComposicion(componenteProductoInstance)
			productoInstance.save(flush: true)
            componenteProductoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'componenteProducto.label', default: 'ComponenteProducto'), params.id])
            redirect(controller: "producto", action: "show", id: params.productoId)
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'componenteProducto.label', default: 'ComponenteProducto'), params.id])
            redirect(controller: "producto", action: "show", id: params.productoId)
        }
    }
}
