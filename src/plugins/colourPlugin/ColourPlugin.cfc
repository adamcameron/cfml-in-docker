import cfmlInDocker.plugins.colourPlugin.implementation.*

component  {

    function init() {
        this.version = "2.2"
        return this
    }

    function ColourPlugin() {
        return new implementation.ColourPlugin()
    }
}
