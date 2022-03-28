component {

	request.testBox.debug("in pseudo constructor")

	static {
		//request.testBox.debug("in static constructor")
	}

	function init() {
		request.testBox.debug("in constructor")
	}

	function testMe() {
		request.testBox.debug("in method")
	}

}
