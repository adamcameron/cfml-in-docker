component extends="app.tests.Test" {

	function testExample() {
		response = processRequest(
			params = {
				controller = "testroute",
				action = "debug"
			},
			returnAs = "struct"
		)

		assert(response.status eq 200)
		assert(response.body contains 'EXPECT [/wheels/tests/app]')
	}
}
