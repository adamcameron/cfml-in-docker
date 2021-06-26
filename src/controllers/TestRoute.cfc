component extends=Controller {

    function debug(){}

	function badRequest(){
        variables.message = "400-BAD-REQUEST"
        header statuscode=400;
    }

	function someModel() {
		someModel = model("SomeModel")
	}

    function testMyPlugin() {
        viewVariables = {
            thing = selectThingById(params.id),
            version = getVersion(),
            secret = getSecret()
        }

        renderView(template="plugin", values=viewVariables)
    }

    function testMyOtherPlugin() {
        myOtherPlugin = MyOtherPlugin()
        viewVariables = {
            thing = myOtherPlugin.selectThingById(params.id),
            version = myOtherPlugin.getVersion(),
            secret = myOtherPlugin.getSecret()
        }

        renderView(template="plugin", values=viewVariables)
    }

    function testColourPlugin() {
        colourPlugin = ColourPlugin()
        viewVariables = {
            colour = colourPlugin.getColourById(params.id)
        }

        renderView(template="plugin", values=viewVariables)
    }
}
