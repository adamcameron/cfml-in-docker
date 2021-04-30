component extends="app.tests.Test" {

	function testExample() {
		result = processRequest(
			params = {
				controller = "wheels",
				action = "wheels"
			},
			returnAs = "struct"
		);

		assert("result.status eq 200");
		assert("result.body contains 'EXPECT [/wheels/tests/app]'");
	}
}
