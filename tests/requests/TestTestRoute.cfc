component extends="app.tests.Test" {

	function testExample() {
		variables.response = processRequest(
			params = {
				controller = "testroute",
				action = "debug"
			},
			returnAs = "struct"
		)
		try {
			assert("variables.response.status eq 200")
			assert("variables.response.body contains 'EXPECTED_CONTENT'")
		} finally {
			structDelete(variables, "response")
		}
	}
}
