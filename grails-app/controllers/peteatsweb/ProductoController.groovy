package peteatsweb
import peteatsweb.Producto
import peteatsweb.Categoria
import peteatsweb.TipoAnimal
class ProductoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def list() {

        def productos = Producto.findAllByPrdEstado("ACT", [sort: 'prdNombre'])  // Lista de productos activos
        def categorias = Categoria.list(sort: "catDes", order: "asc")
        def tiposAnimales = TipoAnimal.list(sort: "animalDes", order: "asc")
        def marcas = Marca.list(sort:"marcaDes", order:"asc")

        return [productos: productos, categorias: categorias, tiposAnimales: tiposAnimales, marcas:marcas]
    }

    def form_ajax() {
        def producto = params.id ? Producto.get(params.id) : new Producto()

        def categorias = Categoria.list(sort: "catDes", order: "asc")
        def tiposAnimales = TipoAnimal.list(sort: "animalDes", order: "asc")

        return [
                producto: producto,
                categorias: categorias,
                tiposAnimales: tiposAnimales
        ]
    }

    def save_ajax() {
        println "Guardar producto: $params"
        def producto

        if (params.id) {
            producto = Producto.get(params.id)
        } else {
            producto = new Producto()
        }

        producto.properties = params

        if (!producto.save(flush: true)) {
            println "Error al guardar producto: ${producto.errors}"
            render "no"
        } else {
            println "Errores (si hay): ${producto.errors}"
            render "ok"
        }
    }

    def show_ajax() {
        def producto = Producto.get(params.id)
        return [producto: producto]
    }

    def delete_ajax() {
        println "Llega: $params"
        def producto = Producto.get(params.id)

        if (!producto) {
            render "error: No se encontró el producto"
            return
        }

        try {
            producto.delete(flush: true)
            render "ok"
        } catch (Exception e) {
            println "Error al eliminar producto: ${e.message}"
            render "error: ${e.message}"
        }
    }
}
