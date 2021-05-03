component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests CFWheels app installation", () => {
            it("serves the CFWheels welcome page after installation", () => {
                http url="http://cfml-in-docker.frontend/" result="response";

                expect(response.status_code).toBe(200, "HTTP status code incorrect")
                expect(response.fileContent).toInclude("<title>CFWheels</title>", "Response body incorrect")
            })

            it("can run the Wheels tests", () => {
                http url="http://cfml-in-docker.frontend/index.cfm?controller=wheels&action=wheels&view=tests&type=app" result="response";

                expect(response.status_code).toBe(200, "HTTP status code incorrect")
                expect(response.fileContent).toInclude("Test Results")
            })
        })
    }
}
