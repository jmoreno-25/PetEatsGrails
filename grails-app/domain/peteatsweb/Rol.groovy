package peteatsweb

class Rol {

    String descripcion

    static mapping = {
        table 'ROL'
        id column: 'ROL_ID', generator: 'identity'
        descripcion column: 'ROL_DESCRIPCION'
        version false
    }

    static constraints = {
        descripcion nullable: true
    }
}

