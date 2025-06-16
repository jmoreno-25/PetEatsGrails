package peteatsweb

class DetallePedido {

    int prdId
    int pedId
    double pedPrecio
    int pedCantidad

    static mapping ={
        table 'detalle_pedido'
        cache usage:'read-write',include:'non-lazy'
        version false
        id generator: 'identity'
        columns {
            id1 column:'id'
            prdId column:'prd_id'
            pedId colum: 'ped_id'
            pedPrecio column:'ped_precio'
            pedCantidad column: 'ped_cantidad'
        }
    }
    static constraints = {
        prdId nullable:false
        pedId nullable:false
    }
}
