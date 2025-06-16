package peteatsweb

class TipoAnimal {
    String animalDes
    static mapping = {
        table 'tipo_animal'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id generator: 'identity'

        columns {
            id column: 'id'
            descripcion column: 'animal_des'
        }
    }
    static constraints = {
        animalDes blank: false
    }
}
