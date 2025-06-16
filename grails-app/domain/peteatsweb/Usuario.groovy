package peteatsweb

class Usuario {

    String cedulaRuc
    String correo
    String password
    String estado
    Date createdAt

    static mapping = {
        table 'USUARIO'
        id column: 'USUARIO_ID', generator: 'identity'
        cedulaRuc column: 'CLI_CEDULA_RUC'
        correo column: 'USUARIO_CORREO'
        password column: 'USUARIO_PASSWORD'
        estado column: 'USUARIO_ESTADO'
        createdAt column: 'CREATED_AT'
        version false
    }

    static constraints = {
        cedulaRuc blank: false
        correo blank: false, email: true
        password blank: false
        estado nullable: true
        createdAt nullable: true
    }
}

