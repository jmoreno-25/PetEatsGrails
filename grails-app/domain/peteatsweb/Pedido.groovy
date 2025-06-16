package peteatsweb

class Pedido {

    int usuarioId
    Date pedFecha
    Double pedSubtotal
    Double pedIva
    Double pedTotal
    String pedEstado

    static mapping = {
        table 'pedido'
        cache usage:'read-write', include:'non-lazy'
        version false
        id generator:'identity'

        columns {
            id1 column: 'id'
            usuarioId column:'usuario_id'
            pedFecha column: 'ped_fecha'
            pedSubtotal column:'ped_subtotal'
            pedIva column:'ped_iva'
            pedTotal column: 'ped_total'
            pedEstado column: 'ped_estado'
        }

    }


    static constraints = {
        usuarioId nullable:false
        pedFecha nullable:false
        pedSubtotal nullable: false
        pedIva nullable: false
        pedTotal nullable: false
        pedEstado inList: ["ACT","ANU","REA"]
    }
}
