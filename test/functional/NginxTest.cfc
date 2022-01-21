component extends=testbox.system.BaseSpec {

    function run() {
        // note: after some reconfig these are all proxying through to Lucee's index.cfm which is not what I want, but CBA fixing right now
        describe("Tests Nginx is serving static content files", () => {

            it("serves gdayWorld.html as 200-OK", () => {
                http url="http://cfml-in-docker.frontend/gdayWorld.html" result="response";

                expect(response.status_code).toBe(200, "HTTP status code incorrect")
                expect(response.fileContent.trim()).toBe( "G'day world!", "Response body incorrect")
            })

            testUris = ["/gdayWorld.html", "/images/test.svg", "/stylesheets/test.css", "javascripts/test.js"]

            testUris.each((uri) => {
                it("serves #uri# via Nginx as 200-OK", () => {
                    http url="http://cfml-in-docker.frontend/#uri#" result="response";

                    expect(response.status_code).toBe(200, "HTTP status code incorrect")
                    expect(response.responseHeader).toHaveKey("Server")
                    expect(response.responseHeader.Server).toInclude("nginx")
                })
            })

            testUris.map((uri) => "/INVALID#uri#").each((uri) => {
                it("serves #uri# as 404", () => {
                    http url="http://cfml-in-docker.frontend/#uri#" result="response";

                    expect(response.status_code).toBe(404, "HTTP status code incorrect")
                    expect(response.fileContent).notToInclude("lucee")
                })
            })
        })
    }
}
