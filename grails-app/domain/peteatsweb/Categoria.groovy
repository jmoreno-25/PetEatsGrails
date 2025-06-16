package peteatsweb

class Categoria {
    String catDes

    static mapping = {
        table 'categoria'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id generator: 'identity'
        columns {
            id column: 'id'
            descripcion column: 'cat_des'
        }
    }
    static constraints = {
        catDes blank: false
    }
}