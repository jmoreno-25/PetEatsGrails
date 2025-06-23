package peteatsweb

class MarcaController {
    static allowedMethods = [save:"POST",update:"PUT",delete:"DELETE"]

    def list(){
        def marcas = Marca.list([sort:'id'])
        return [marcas:marcas]
    }
    def form_ajax(){
        def marca
        if(params.id){
            marca = new Marca()
        }
        return [marca:marca]
    }
    def save_ajax(){
        def marca
        if(params.id){
            marca =Marca.get(params.id)
        }else{
            marca = new Marca()
        }
        marca.properties = params
        if (!categoria.save(flush: true)) {
            println "Error al guardar la marca: ${marca.errors}"
            render "no"
        } else {
            println "Errores (si hay): ${marca.errors}"
            render "ok"
        }
    }
    def show_ajax(){
        def marca = Marca.get(params.id)
        return [marca:marca]
    }
    def buscar_ajax(){
        def marca = Marca.findAllByMarcaDesIlike('%'+params.criterio+'%')
        return [marca:marca]
    }
    def delete_ajax(){
        def marca = Marca.get(params.id)
        if(!marca){
            render "error: No se encontró la marca"
            return
        }
        try {
            marca.delete(flush: true)
            render "ok"
        } catch (Exception e) {
            println "Error al eliminar marca: ${e.message}"
            render "error: ${e.message}"
        }
    }
}
