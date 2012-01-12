package sieym

import org.springframework.dao.DataIntegrityViolationException

class MaquinaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [maquinaInstanceList: Maquina.list(params), maquinaInstanceTotal: Maquina.count()]
    }

    def create() {
        [maquinaInstance: new Maquina(params)]
    }

    def save() {
        def maquinaInstance = new Maquina(params)
        if (!maquinaInstance.save(flush: true)) {
            render(view: "create", model: [maquinaInstance: maquinaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'maquina.label', default: 'Maquina'), maquinaInstance.id])
        redirect(action: "show", id: maquinaInstance.id)
    }

    def show() {
        def maquinaInstance = Maquina.get(params.id)
        if (!maquinaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect(action: "list")
            return
        }

        [maquinaInstance: maquinaInstance]
    }

    def edit() {
        def maquinaInstance = Maquina.get(params.id)
        if (!maquinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect(action: "list")
            return
        }

        [maquinaInstance: maquinaInstance]
    }

    def update() {
        def maquinaInstance = Maquina.get(params.id)
        if (!maquinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (maquinaInstance.version > version) {
                maquinaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'maquina.label', default: 'Maquina')] as Object[],
                          "Another user has updated this Maquina while you were editing")
                render(view: "edit", model: [maquinaInstance: maquinaInstance])
                return
            }
        }

        maquinaInstance.properties = params

        if (!maquinaInstance.save(flush: true)) {
            render(view: "edit", model: [maquinaInstance: maquinaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'maquina.label', default: 'Maquina'), maquinaInstance.id])
        redirect(action: "show", id: maquinaInstance.id)
    }

    def delete() {
        def maquinaInstance = Maquina.get(params.id)
        if (!maquinaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect(action: "list")
            return
        }

        try {
            maquinaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
