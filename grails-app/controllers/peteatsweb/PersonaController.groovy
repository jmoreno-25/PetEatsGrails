package peteatsweb

import groovy.sql.Sql


class PersonaController {

    def dataSource
    def conectaDb() {
        Sql sql = new Sql(dataSource)
        return sql
    }


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

    def buscar_ajax() {
        //println "llega: $params"
        //def personas = Persona.findAllByNombreIlike('%' + params.criterio + '%')
        //println "personas: ${personas.size()}"
        //return [personas: personas, contador: personas.size()]
        //buscador para nombres y apellidos
        def cr = '%' + params.criterio + '%'
        def cn = conectaDb()
        def sql = "select prsn__id id from prsn where prsnnmbr ilike '${cr}' or prsnapll ilike '${cr}'"
        def personas = []
        cn.eachRow(sql.toString()) { row ->
            personas.add( Persona.get(row.id) )
        }
        println "personas: $personas"
        [personas: personas, contador: personas.size()]
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

    def contar(){
        def cn= conectaDb()
        println "Conectado a la base de datos"
        def sql = "select count(*) cnta from prsn"
        def cuenta = cn.rows(sql.toString())[0].cnta
        render cuenta
    }
}
