import cfmlInDocker.dao.MyDao
import cfmlInDocker.models.Thing
import cfmlInDocker.plugins.myPlugin.MyPlugin

component extends=MyPlugin {

    function init() {
        this.version = "2.2"

        variables.dao = new MyDao()

        return this
    }

    this.MyOtherPlugin = function () {
        return {
            selectThingById = (id) => super.selectThingById(id),
            getVersion = () => super.getVersion(),
            getSecret = () => super.getSecret()
        }
    }
}
