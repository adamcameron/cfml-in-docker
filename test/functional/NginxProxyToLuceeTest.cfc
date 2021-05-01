component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests Nginx proxies CFML requests to Lucee", () => {
            it("proxies a CFM request to Lucee", () => {
                http url="http://cfml-in-docker.frontend/non-wheels-tests/gdayWorld.cfm" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe("G'day world!", "Response body incorrect")
            })

            it("passes query values to Lucee", () => {
                expectedValue = "expectedValue"

                http url="http://cfml-in-docker.frontend/non-wheels-tests/queryTest.cfm?testParam=#expectedValue#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe("Expected query param value: [#expectedValue#]", "Query parameter value was incorrect")
            })

            it("passes the upstream remote address to Lucee", () => {
                http url="http://cfml-in-docker.lucee:8888/public/non-wheels-tests/remoteAddrTest.cfm" result="response";
                expectedRemoteAddr = response.fileContent

                http url="http://cfml-in-docker.frontend/non-wheels-tests/remoteAddrTest.cfm" result="testResponse";
                actualRemoteAddr = testResponse.fileContent

                expect(actualRemoteAddr).toBe(expectedRemoteAddr, "Remote address was incorrect")
            })

            it("passes URL path_info to Lucee correctly", () => {
                testPathInfo = "/additional/path/info/"

                // will require a specific mapping in web.xml for this to work
                http url="http://cfml-in-docker.frontend/non-wheels-tests/pathInfoTest.cfm#testPathInfo#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe("Expected PATH_INFO: [#testPathInfo#]", "PATH_INFO value was incorrect")
            })

            it("handles .cfm 404s via Lucee", () => {
                http url="http://cfml-in-docker.frontend/non-wheels-tests/notValid.cfm" result="response";

                expect(response.status_code).toBe(404, "Expected to receive a 404")
                expect(response.fileContent).toInclude("lucee")
            })

            it("passes directory URLs to Lucee", () => {
                testSlug = "/non-wheels-tests/sub-dir/"
                http url="http://cfml-in-docker.frontend#testSlug#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toBe("Expected test response: [#testSlug#index.cfm]")
            })
        })

        describe("Testing proxying to URLs served by CFWheels", () => {
            it("handles PATH_INFO correctly", () => {
                testSlug = "/wheels-tests/path-info/"
                http url="http://cfml-in-docker.frontend#testSlug#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude("Expected test response: [#testSlug#]")
            })

            it("passes directory URLs to CFWheels to handle", () => {
                testSlug = "/wheels-tests/sub-dir/"
                http url="http://cfml-in-docker.frontend#testSlug#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude("Expected test response: [#testSlug#index.cfm]")
            })
        })
    }
}
