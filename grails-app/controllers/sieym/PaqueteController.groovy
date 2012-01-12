package sieym

import org.springframework.dao.DataIntegrityViolationException

class PaqueteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paqueteInstanceList: Paquete.list(params), paqueteInstanceTotal: Paquete.count()]
    }

    def create() {
        [paqueteInstance: new Paquete(params)]
    }

    def save() {
        def paqueteInstance = new Paquete(params)
        if (!paqueteInstance.save(flush: true)) {
            render(view: "create", model: [paqueteInstance: paqueteInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'paquete.label', default: 'Paquete'), paqueteInstance.id])
        redirect(action: "show", id: paqueteInstance.id)
    }

    def show() {
        def paqueteInstance = Paquete.get(params.id)
        if (!paqueteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'paquete.label', default: 'Paquete'), params.id])
            redirect(action: "list")
            return
        }

        [paqueteInstance: paqueteInstance]
    }

    def edit() {
        def paqueteInstance = Paquete.get(params.id)
        if (!paqueteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paquete.label', default: 'Paquete'), params.id])
            redirect(action: "list")
            return
        }

        [paqueteInstance: paqueteInstance]
    }

    def update() {
        def paqueteInstance = Paquete.get(params.id)
        if (!paqueteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paquete.label', default: 'Paquete'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (paqueteInstance.version > version) {
                paqueteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'paquete.label', default: 'Paquete')] as Object[],
                          "Another user has updated this Paquete while you were editing")
                render(view: "edit", model: [paqueteInstance: paqueteInstance])
                return
            }
        }

        paqueteInstance.properties = params

        if (!paqueteInstance.save(flush: true)) {
            render(view: "edit", model: [paqueteInstance: paqueteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'paquete.label', default: 'Paquete'), paqueteInstance.id])
        redirect(action: "show", id: paqueteInstance.id)
    }

    def delete() {
        def paqueteInstance = Paquete.get(params.id)
        if (!paqueteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'paquete.label', default: 'Paquete'), params.id])
            redirect(action: "list")
            return
        }

        try {
            paqueteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'paquete.label', default: 'Paquete'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'paquete.label', default: 'Paquete'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
