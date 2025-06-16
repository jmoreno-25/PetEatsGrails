package peteatsweb

class PersonaController {

    def list() {
        def personas = Persona.list([sort: 'nombre'])

        return [personas: personas]
    }

    def form_ajax() {
        def persona

        if(params.id) {
            persona = Persona.get(params.id)
        } else {
            persona = new Persona()
        }
        return [personaInstance: persona]
    }

    def save_ajax(){
        println "guarda persona: $params"
        def persona

        if(params.id){
            persona = Persona.get(params.id)
        }else{
            persona = new Persona()
        }

        persona.properties = params

        persona.password = params.password.encodeAsMD5()

        if(!persona.save(flush:true)){
            println("error al guardar la persona " + persona.errors)
            render "no"
        }else{
            println "errores: ${persona.errors}"
            render "ok"
        }
    }
}
