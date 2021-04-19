component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests Nginx is serving html", () => {
            it("serves gdayWorld.html as 200-OK", () => {
                http url="http://cfml-in-docker.frontend/gdayWorld.html" result="response";

                expect(response.status_code).toBe( 200, "HTTP status code incorrect")
                expect(response.fileContent.trim()).toBe( "G'day world!", "Response body incorrect")
            })
        })
    }
}
