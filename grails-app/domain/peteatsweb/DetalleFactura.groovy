package peteatsweb

class DetalleFactura {

    int facId
    int dPedId

    static mapping = {
        table 'detalle_factura'
        cache usage:'read-write', include: 'non-lazy'
        version false
        id generator: 'identity'
        columns {
            id1 column:'id'
            facId column:'fac_id'
            dPedId colum:'d_ped_id'

        }
    }
    static constraints = {
        facId nullable:false
        dPedId nullable:false
    }
}
