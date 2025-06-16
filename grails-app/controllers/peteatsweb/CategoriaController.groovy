package peteatsweb

class CategoriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def list() {
        def categorias = Categoria.list([sort: 'id'])  // Asegúrate de que 'nombre' sea un campo válido
        return [categorias: categorias]
    }

    def form_ajax() {
        def categoria

        if (params.id) {
            categoria = Categoria.get(params.id)
        } else {
            categoria = new Categoria()
        }

        return [categoria: categoria]
    }

    def save_ajax() {
        println "Guardar categoría: $params"
        def categoria

        if (params.id) {
            categoria = Categoria.get(params.id)
        } else {
            categoria = new Categoria()
        }

        categoria.properties = params
        if (!categoria.save(flush: true)) {
            println "Error al guardar la categoría: ${categoria.errors}"
            render "no"
        } else {
            println "Errores (si hay): ${categoria.errors}"
            render "ok"
        }
    }

    def show_ajax() {
        def categoria = Categoria.get(params.id)
        return [categoria: categoria]
    }
    def buscar_ajax() {
        def categorias = Categoria.findAllByCatDesIlike('%'+ params.criterio +'%')
        [categorias: categorias]
    }

    def delete_ajax() {
        println "Llega: $params"
        def categoria = Categoria.get(params.id)

        if (!categoria) {
            render "error: No se encontró la categoría"
            return
        }

        try {
            categoria.delete(flush: true)
            render "ok"
        } catch (Exception e) {
            println "Error al eliminar categoría: ${e.message}"
            render "error: ${e.message}"
        }
    }
}
