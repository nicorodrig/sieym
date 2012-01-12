package sieym

import org.springframework.dao.DataIntegrityViolationException

class MateriaPrimaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [materiaPrimaInstanceList: MateriaPrima.list(params), materiaPrimaInstanceTotal: MateriaPrima.count()]
    }

    def create() {
        [materiaPrimaInstance: new MateriaPrima(params)]
    }

    def save() {
		println params
        def materiaPrimaInstance = new MateriaPrima(params)
        if (!materiaPrimaInstance.save(flush: true)) {
            render(view: "create", model: [materiaPrimaInstance: materiaPrimaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), materiaPrimaInstance.id])
        redirect(action: "show", id: materiaPrimaInstance.id)
    }

    def show() {
        def materiaPrimaInstance = MateriaPrima.get(params.id)
		println materiaPrimaInstance.coeficienteProduccion
        if (!materiaPrimaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])
            redirect(action: "list")
            return
        }

        [materiaPrimaInstance: materiaPrimaInstance]
    }

    def edit() {
        def materiaPrimaInstance = MateriaPrima.get(params.id)
        if (!materiaPrimaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])
            redirect(action: "list")
            return
        }

        [materiaPrimaInstance: materiaPrimaInstance]
    }

    def update() {
        def materiaPrimaInstance = MateriaPrima.get(params.id)
        if (!materiaPrimaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (materiaPrimaInstance.version > version) {
                materiaPrimaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materiaPrima.label', default: 'MateriaPrima')] as Object[],
                          "Another user has updated this MateriaPrima while you were editing")
                render(view: "edit", model: [materiaPrimaInstance: materiaPrimaInstance])
                return
            }
        }

        materiaPrimaInstance.properties = params

        if (!materiaPrimaInstance.save(flush: true)) {
            render(view: "edit", model: [materiaPrimaInstance: materiaPrimaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), materiaPrimaInstance.id])
        redirect(action: "show", id: materiaPrimaInstance.id)
    }

    def delete() {
        def materiaPrimaInstance = MateriaPrima.get(params.id)
        if (!materiaPrimaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])
            redirect(action: "list")
            return
        }

        try {
            materiaPrimaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materiaPrima.label', default: 'MateriaPrima'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
