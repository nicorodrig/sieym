package sieym

import org.joda.time.Duration;
import org.springframework.dao.DataIntegrityViolationException

class FaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [faseInstanceList: Fase.list(params), faseInstanceTotal: Fase.count()]
    }

    def create() {
        [faseInstance: new Fase(params)]
    }

    def save() {
		params.duracion = Duration.standardHours(params.duracion as Integer)
        def faseInstance = new Fase(params)
        if (!faseInstance.save(flush: true)) {
            render(view: "create", model: [faseInstance: faseInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'fase.label', default: 'Fase'), faseInstance.id])
        redirect(action: "show", id: faseInstance.id)
    }

    def show() {
        def faseInstance = Fase.get(params.id)
        if (!faseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'fase.label', default: 'Fase'), params.id])
            redirect(action: "list")
            return
        }

        [faseInstance: faseInstance]
    }

    def edit() {
        def faseInstance = Fase.get(params.id)
        if (!faseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fase.label', default: 'Fase'), params.id])
            redirect(action: "list")
            return
        }

        [faseInstance: faseInstance]
    }

    def update() {
        def faseInstance = Fase.get(params.id)
        if (!faseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fase.label', default: 'Fase'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (faseInstance.version > version) {
                faseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fase.label', default: 'Fase')] as Object[],
                          "Another user has updated this Fase while you were editing")
                render(view: "edit", model: [faseInstance: faseInstance])
                return
            }
        }

		params.duracion = Duration.standardHours(params.duracion as Integer)
        faseInstance.properties = params

        if (!faseInstance.save(flush: true)) {
            render(view: "edit", model: [faseInstance: faseInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'fase.label', default: 'Fase'), faseInstance.id])
        redirect(action: "show", id: faseInstance.id)
    }

    def delete() {
        def faseInstance = Fase.get(params.id)
        if (!faseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'fase.label', default: 'Fase'), params.id])
            redirect(action: "list")
            return
        }

        try {
            faseInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'fase.label', default: 'Fase'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fase.label', default: 'Fase'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
