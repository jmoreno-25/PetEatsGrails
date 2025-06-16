package peteatsweb

class Marca {

    String marcaDes

    static mapping = {
        table 'marca'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'id'
            marcaDes column: 'marca_des'
        }
    }
    static constraints = {
        marcaDes nullable: false
    }
}
