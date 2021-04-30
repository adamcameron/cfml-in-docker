component extends="app.tests.Test" {

    variables.callstack = []

	function packageSetup() {
        variables.callstack.append("#getFunctionCalledName()# called")
	}

	function setup() {
        variables.callstack.append("#getFunctionCalledName()# called")
	}

	/**
	 * it runs packageSetup and then setup
	 */
	function testSetupRunsAfterPackageSetup() {
		assert("variables.callstack.len() == 2")
		assert('variables.callstack[1] == "packageSetup called"')
		assert('variables.callstack[2] == "setup called"')
	}
}
