package peteatsweb

class Producto {
    Categoria categoria
    TipoAnimal tipoAnimal
    Marca marca

    String prdNombre
    String prdImagen
    String prdDescripcion
    BigDecimal prdPrecio
    Integer prdStock
    String prdEstado

    static mapping = {
        table 'producto'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id generator: 'identity'
        columns {
            id1 column: 'id'
            categoria column: 'categoria_id'
            tipoAnimal column: 'tipo_animal_id'
            marca column: 'marca_id'
            prdNombre column: 'prd_nombre'
            prdImagen column: 'prd_imagen'
            prdDescripcion column: 'prd_descripcion'
            prdPrecio column: 'prd_precio'
            prdStock column: 'prd_stock'
            prdEstado column: 'prd_estado'
        }
    }

    static constraints = {
        prdNombre blank: false
        prdImagen nullable:true
        prdDescripcion nullable: true
        prdPrecio nullable: false
        prdStock min: 0
        prdEstado inList: ["ACT", "INA"]
    }
}


