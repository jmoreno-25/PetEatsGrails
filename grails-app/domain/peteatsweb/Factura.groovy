package peteatsweb

class Factura {
    String cliCedulaRuc
    int pedId
    Date facFecha
    String facEstado
    static mapping={
       table 'factura'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id generator: 'identity'
        columns {
            id1 column: 'id'
            cliCedulaRuc column: 'cli_cedula_ruc'
            pedId column: 'ped_id'
            facFecha column: 'fac_fecha'
            facEstado column: 'fac_estado'
        }
    }
    static constraints = {
        cliCedulaRuc nullable:false
        pedId nullable:false
        facFecha nullable:false
        facEstado inList: ["ACT", "ANU","PAG"]
    }
}
