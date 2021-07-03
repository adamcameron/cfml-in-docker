import cfmlInDocker.dao.MyDao
import cfmlInDocker.models.Thing

component {

    function init() {
        this.version = "2.2"

        variables.dao = new MyDao()

        return this
    }

    this.selectThingById = function (id) {
        record = variables.dao.selectThingById(id)
        if (record.recordCount) {
            return new Thing(record.id, record.name)
        }
        throw(type="ThingNotFoundException", message="Thing not found", detail="Data for Thing with ID #id# not found")
    }

    this.getVersion = function () {
        return this.version
    }

    this.getSecret = function () {
        return variables.getSecret()
    }

    private function selectThingById(id) {
        return variables.dao.selectThingById(id)
    }

    private function getSecret() {
        return "sssshhhh"
    }
}
