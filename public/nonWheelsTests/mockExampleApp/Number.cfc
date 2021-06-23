// Number.cfc
component {

    function init(values) {
        local.goodValues = this.validate(arguments.values)
        variables.english = local.goodValues.english
        variables.maori = local.goodValues.maori
    }
   
    function setDao(dao) {
        variables.dao = arguments.dao
    }
   
    function validate(struct rawValues) {
        // validation logic here
        // returns either good values
        // or throws a ValidationException
        return {english=arguments.rawValues.english, maori=arguments.rawValues.maori}
    }
   
    function save() {
        variables.dao.insert(variables.english, variables.maori)
    }
}