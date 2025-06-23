package peteatsweb
class PersonaController {

    def list() {
        def personas = Persona.list([sort: 'id'])
        return [productos: personas]
    }

    def form_ajax() {
        def persona
        if (params.id) {
            persona = Persona.get(params.id)
        } else {
            persona = new Persona()
        }
        return [persona:persona]
    }

    def save_ajax() {
        def persona

        if (params.id) {
            persona = Persona.get(params.id)
            if (!persona) {
                render "ERROR*No se encontró la persona"
                return
            }
        } else {
            persona = new Persona()
        }

        persona.properties = params

        if (!persona.save(flush: true)) {
            render "ERROR*No se pudo guardar la persona: ${persona.errors.allErrors.join(', ')}"
            return
        }

        render "ok"
    }

    def buscar_ajax(){
        def personas = Persona.findAllByNombreIlike('%'+params.criterio+'%')
        [personas:personas]
    }

    def show_ajax(){
        def persona = Persona.get(params.id)
        return [persona: persona]
    }

    def delete_ajax() {
        println "llega a delete: $params"
        def persona = Persona.get(params.id)
        persona.delete(flush: true)
        println "borrado ${params.id} $persona"
        render "ok"
    }
}
