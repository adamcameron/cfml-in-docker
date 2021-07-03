component extends=Controller {

    function init(){
        super.init(argumentCollection=arguments)
        writeDump(getCallStack())
        abort;
    }


    function debug(){}

	function badRequest(){
        variables.message = "400-BAD-REQUEST"
        header statuscode=400;
    }

	function someModel() {
		someModel = model("SomeModel")

	}
}
