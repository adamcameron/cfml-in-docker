component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests Lucee is serving CFML", () => {
            it("serves gdayWorld.cfm as 200-OK on Lucee's internal web server", () => {
                http url="http://cfml-in-docker.lucee:8888/public/non-wheels-tests/gdayWorld.cfm" result="response";

                expect(response.status_code).toBe( 200, "HTTP status code incorrect")
                expect(response.fileContent.trim()).toBe( "G'day world!", "Response body incorrect")
            })
        })
    }
}
