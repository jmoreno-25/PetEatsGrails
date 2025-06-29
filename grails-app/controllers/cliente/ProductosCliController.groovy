package cliente
import peteatsweb.Producto

class ProductosCliController {

    def index() {
        def productos = Producto.findAllByPrdEstado("ACT")
        [productos: productos]
    }
}
