package sieym

import org.springframework.dao.DataIntegrityViolationException

class CamionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [camionInstanceList: Camion.list(params), camionInstanceTotal: Camion.count()]
    }

    def create() {
        [camionInstance: new Camion(params)]
    }

    def save() {
        def camionInstance = new Camion(params)
        if (!camionInstance.save(flush: true)) {
            render(view: "create", model: [camionInstance: camionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'camion.label', default: 'Camion'), camionInstance.id])
        redirect(action: "show", id: camionInstance.id)
    }

    def show() {
        def camionInstance = Camion.get(params.id)
        if (!camionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'camion.label', default: 'Camion'), params.id])
            redirect(action: "list")
            return
        }

        [camionInstance: camionInstance]
    }

    def edit() {
        def camionInstance = Camion.get(params.id)
        if (!camionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'camion.label', default: 'Camion'), params.id])
            redirect(action: "list")
            return
        }

        [camionInstance: camionInstance]
    }

    def update() {
        def camionInstance = Camion.get(params.id)
        if (!camionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'camion.label', default: 'Camion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (camionInstance.version > version) {
                camionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'camion.label', default: 'Camion')] as Object[],
                          "Another user has updated this Camion while you were editing")
                render(view: "edit", model: [camionInstance: camionInstance])
                return
            }
        }

        camionInstance.properties = params

        if (!camionInstance.save(flush: true)) {
            render(view: "edit", model: [camionInstance: camionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'camion.label', default: 'Camion'), camionInstance.id])
        redirect(action: "show", id: camionInstance.id)
    }

    def delete() {
        def camionInstance = Camion.get(params.id)
        if (!camionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'camion.label', default: 'Camion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            camionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'camion.label', default: 'Camion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'camion.label', default: 'Camion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
