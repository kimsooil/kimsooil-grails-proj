package braintumorpathologyreview

class CaseDetailsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [caseDetailsInstanceList: CaseDetails.list(params), caseDetailsInstanceTotal: CaseDetails.count()]
    }

    def create = {
        def caseDetailsInstance = new CaseDetails()
        caseDetailsInstance.properties = params
        return [caseDetailsInstance: caseDetailsInstance]
    }

    def save = {
        def caseDetailsInstance = new CaseDetails(params)
        if (caseDetailsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), caseDetailsInstance.id])}"
            redirect(action: "show", id: caseDetailsInstance.id)
        }
        else {
            render(view: "create", model: [caseDetailsInstance: caseDetailsInstance])
        }
    }

    def show = {
        def caseDetailsInstance = CaseDetails.get(params.id)
        if (!caseDetailsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), params.id])}"
            redirect(action: "list")
        }
        else {
            [caseDetailsInstance: caseDetailsInstance]
        }
    }

    def edit = {
        def caseDetailsInstance = CaseDetails.get(params.id)
        if (!caseDetailsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [caseDetailsInstance: caseDetailsInstance]
        }
    }

    def update = {
        def caseDetailsInstance = CaseDetails.get(params.id)
        if (caseDetailsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (caseDetailsInstance.version > version) {
                    
                    caseDetailsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'caseDetails.label', default: 'CaseDetails')] as Object[], "Another user has updated this CaseDetails while you were editing")
                    render(view: "edit", model: [caseDetailsInstance: caseDetailsInstance])
                    return
                }
            }
            caseDetailsInstance.properties = params
            if (!caseDetailsInstance.hasErrors() && caseDetailsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), caseDetailsInstance.id])}"
                redirect(action: "show", id: caseDetailsInstance.id)
            }
            else {
                render(view: "edit", model: [caseDetailsInstance: caseDetailsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def caseDetailsInstance = CaseDetails.get(params.id)
        if (caseDetailsInstance) {
            try {
                caseDetailsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), params.id])}"
            redirect(action: "list")
        }
    }
}
