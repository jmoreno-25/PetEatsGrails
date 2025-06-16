package peteatsweb

class TipoAnimalController {

    def list() {
        def tiposAnimales = TipoAnimal.list(sort: "id")
        [tiposAnimales: tiposAnimales]
    }

    def form_ajax() {
        def tipoAnimal = params.id ? TipoAnimal.get(params.id) : new TipoAnimal()
        [tipoAnimal: tipoAnimal]
    }

    def show_ajax() {
        def tipoAnimal = TipoAnimal.get(params.id)
        [tipoAnimal: tipoAnimal]
    }

    def save_ajax() {
        def tipoAnimal = params.id ? TipoAnimal.get(params.id) : new TipoAnimal()
        tipoAnimal.properties = params

        if (!tipoAnimal.save(flush: true)) {
            render "error"
        } else {
            render "ok"
        }
    }

    def delete_ajax() {
        def tipoAnimal = TipoAnimal.get(params.id)
        try {
            tipoAnimal?.delete(flush: true)
            render "ok"
        } catch (e) {
            render "error: ${e.message}"
        }
    }
}
