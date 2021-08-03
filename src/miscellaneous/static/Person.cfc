component {

    public function init(firstName, lastName) {
        this.firstName = arguments.firstName
        this.lastName = arguments.lastName
    }

    public function setRepository(PersonRepository repository) {
        variables.repository = arguments.repository
    }

    public function setId(required numeric id) {
        this.id = arguments.id
    }

    public static function getById(required numeric id) {
        values = variables.repository.loadById(id)

        person = new Person(values.firstName, values.lastName)
        person.setId(id)

        return person
    }
}
