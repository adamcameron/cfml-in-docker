import cfmlInDocker.dao.MyDao

component {

    function init() {
        this.version ="1.0.0.0"
        variables.dao = new MyDao()
        return this
    }

    function selectThingById(id) {
        return (function (id) {
            return variables.dao.selectThingById(id)
        })(id)
    }
}
