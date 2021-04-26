component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests CFWheels app installation", () => {
            it("serves the CFWheels welcome page after installation", () => {
                http url="http://cfml-in-docker.frontend/" result="response";

                expect(response.status_code).toBe( 200, "HTTP status code incorrect")
                expect(response.fileContent.trim()).toBe( "NOT SURE YET", "Response body incorrect")
            })
        })
    }
}
