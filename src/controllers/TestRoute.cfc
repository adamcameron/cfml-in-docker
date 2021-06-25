component extends=Controller {

    function debug(){}

	function badRequest(){
        variables.message = "400-BAD-REQUEST"
        header statuscode=400;
    }

	function someModel() {
		someModel = model("SomeModel")
	}

    function getThingsById() {
        //variables.thing = selectThingById(params.id)
    }
}
