component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests Nginx proxies CFML requests to Lucee", () => {
            it("proxies a CFM request to Lucee", () => {
                http url="http://cfml-in-docker.frontend/nonWheelsTests/gdayWorld.cfm" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe("G'day world!", "Response body incorrect")
            })

            it("passes query values to Lucee", () => {
                expectedParamValue = "expectedValue"
                testUrl = "http://cfml-in-docker.frontend/nonWheelsTests/queryTest.cfm?testParam=#expectedParamValue#"

                http url=testUrl result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude(
                    "Expected query param value: [#expectedParamValue#]",
                    "Query parameter value was incorrect (URL: #testUrl#)"
                )
            })

            it("passes the upstream remote address to Lucee", () => {
                http url="http://cfml-in-docker.lucee:8888/nonWheelsTests/remoteAddrTest.cfm" result="response";
                expectedRemoteAddr = response.fileContent

                http url="http://cfml-in-docker.frontend/nonWheelsTests/remoteAddrTest.cfm" result="testResponse";
                actualRemoteAddr = testResponse.fileContent

                expect(actualRemoteAddr).toBe(expectedRemoteAddr, "Remote address was incorrect")
            })

            it("passes URL path_info to Lucee correctly", () => {
                testPathInfo = "/additional/path/info/"

                // will require a specific mapping in web.xml for this to work
                http url="http://cfml-in-docker.frontend/nonWheelsTests/pathInfoTest.cfm#testPathInfo#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe("Expected PATH_INFO: [#testPathInfo#]", "PATH_INFO value was incorrect")
            })

            it("handles .cfm 404s via Lucee", () => {
                http url="http://cfml-in-docker.frontend/nonWheelsTests/notValid.cfm" result="response";

                expect(response.status_code).toBe(404, "Expected to receive a 404")
                expect(response.fileContent).toInclude("lucee")
            })

            it("passes directory URLs to Lucee", () => {
                testSlug = "/nonWheelsTests/sub-dir/"
                http url="http://cfml-in-docker.frontend#testSlug#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude("Expected test response: [#testSlug#index.cfm]")
            })

            it("passes path_info and query parameters to Lucee when both are present", () => {
                testPathInfo = "/additional/path/info/"
                expectedParamValue = "expectedValue"
                testUrl = "http://cfml-in-docker.frontend/nonWheelsTests/pathInfoTest.cfm#testPathInfo#?testParam=#expectedParamValue#"

                // will require a specific mapping in web.xml for this to work
                http url=testUrl result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude(
                    "Expected PATH_INFO: [#testPathInfo#]",
                    "PATH_INFO value was incorrect (URL: #testUrl#)"
                )
                expect(response.fileContent).toInclude(
                    "Expected query param value: [#expectedParamValue#]",
                    "Query parameter value was incorrect (URL: #testUrl#)"
                )
            })
        })

        describe("Testing proxying to URLs served by CFWheels", () => {
            it("handles PATH_INFO correctly", () => {
                testSlug = "/wheels-tests/path-info/"
                http url="http://cfml-in-docker.frontend#testSlug#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude("Expected test response: [/index.cfm][#testSlug#]")
            })

            it("passes directory URLs to CFWheels to handle", () => {
                testSlug = "/wheels-tests/sub-dir/"
                http url="http://cfml-in-docker.frontend#testSlug#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude("Expected test response: [/index.cfm][#testSlug#]")
            })

            it("passes query values on URLs served by CFWheels", () => {
                testSlug = "/wheels-tests/path-info/"
                expectedParamValue = "expectedValue"
                testUrl = "http://cfml-in-docker.frontend#testSlug#?testParam=#expectedParamValue#"

                http url=testUrl result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude(
                    "Expected query param value: [#expectedParamValue#]",
                    "Query parameter value was incorrect (URL: #testUrl#)"
                )
            })

            it("passes path_info and query parameters on URLs served by CFWheels", () => {
                testSlug = "/wheels-tests/path-info/"
                expectedParamValue = "expectedValue"
                testUrl = "http://cfml-in-docker.frontend#testSlug#?testParam=#expectedParamValue#"

                // will require a specific mapping in web.xml for this to work
                http url=testUrl result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent).toInclude(
                    "Expected test response: [/index.cfm][#testSlug#]",
                    "PATH_INFO value was incorrect (URL: #testUrl#)"
                )
                expect(response.fileContent).toInclude(
                    "Expected query param value: [#expectedParamValue#]",
                    "Query parameter value was incorrect (URL: #testUrl#)"
                )
            })
        })
    }
}
