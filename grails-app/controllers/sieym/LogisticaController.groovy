package sieym

import org.springframework.dao.DataIntegrityViolationException

class LogisticaController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "edit", params: [id: 1])
    }

    def edit() {
        def logisticaInstance = Logistica.get(params.id)
        if (!logisticaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logistica.label', default: 'Logistica'), params.id])
            redirect(uri: "/msg")
            return
        }

        [logisticaInstance: logisticaInstance]
    }

    def update() {
        def logisticaInstance = Logistica.get(params.id)
        if (!logisticaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logistica.label', default: 'Logistica'), params.id])
            redirect(uri: "/msg")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (logisticaInstance.version > version) {
                logisticaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'logistica.label', default: 'Logistica')] as Object[],
                          "Another user has updated this Logistica while you were editing")
                render(view: "edit", model: [logisticaInstance: logisticaInstance])
                return
            }
        }

        logisticaInstance.properties = params

        if (!logisticaInstance.save(flush: true)) {
            render(view: "edit", model: [logisticaInstance: logisticaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'logistica.label', default: 'Logistica'), logisticaInstance.id])
        redirect(action: "edit", id: logisticaInstance.id)
    }

}
