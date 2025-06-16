package peteatsweb

class Cliente {

    String cedulaRuc
    String nombre
    String apellido
    String telefono
    String direccion
    String estado
    Date createdAt

    static mapping = {
        table 'CLIENTE'
        id name: 'cedulaRuc', column: 'CLI_CEDULA_RUC', generator: 'assigned'
        nombre column: 'CLI_NOMBRE'
        apellido column: 'CLI_APELLIDO'
        telefono column: 'CLI_TELEFONO'
        direccion column: 'CLI_DIRECCION'
        estado column: 'CLI_ESTADO'
        createdAt column: 'CREATED_AT'
        version false
    }

    static constraints = {
        cedulaRuc blank: false
        nombre blank: false
        apellido blank: false
        telefono nullable: true
        estado nullable: true
        direccion nullable:true
        createdAt nullable: true
    }
}

