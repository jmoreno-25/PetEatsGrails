package peteatsweb

import groovy.sql.Sql

class TipoAnimalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def dataSource
    def conectaDb() {
        Sql sql = new Sql(dataSource)
        return sql
    }
    def list() {
        def tiposAnimales = TipoAnimal.list(sort: "id")
        [tiposAnimales: tiposAnimales]
    }

    def form_ajax() {
        def tipoAnimal = params.id ? TipoAnimal.get(params.id) : new TipoAnimal()
        [tipoAnimal: tipoAnimal]
    }

    def buscar_ajax() {
        println "entrando"
        def cr = '%' + params.criterio + '%'
        def cn = conectaDb()
        def sql = "select id from tipo_animal where animal_des ilike '${cr}'"
        def tipoAnimal = []
        cn.eachRow(sql.toString()) { row ->
            tipoAnimal.add( TipoAnimal.get(row.id) )
        }
        println "tipoAnimal: $tipoAnimal"
        println "contador: $tipoAnimal.size()"
        [tipoAnimal: tipoAnimal, contador: tipoAnimal.size()]
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
