component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests Nginx proxies CFML requests to Lucee", () => {
            it("proxies a CFM request to Lucee", () => {
                http url="http://cfml-in-docker.frontend/gdayWorld.cfm" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe("G'day world!", "Response body incorrect")
            })

            it("passes query values to Lucee", () => {
                http url="http://cfml-in-docker.frontend/queryTest.cfm?testParam=expectedValue" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe("expectedValue", "Query parameter value was incorrect")
            })

            it("passes the upstream remote address to Lucee", () => {
                http url="http://cfml-in-docker.lucee:8888/public/remoteAddrTest.cfm" result="response";
                expectedRemoteAddr = response.fileContent

                http url="http://cfml-in-docker.lucee:8888/public/remoteAddrTest.cfm" result="testResponse";
                actualRemoteAddr = testResponse.fileContent

                expect(actualRemoteAddr).toBe(expectedRemoteAddr, "Remote address was incorrect")
            })

            it("passes URL path_info to Lucee correctly", () => {
                testPathInfo = "/additional/path/info/"

                http url="http://cfml-in-docker.frontend/test/index.cfm#testPathInfo#" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe(testPathInfo, "PATH_INFO value was incorrect")
            })

            it("handles .cfm 404s via Lucee", () => {
                http url="http://cfml-in-docker.frontend/notValid.cfm" result="response";

                expect(response.status_code).toBe(404, "Expected to receive a 404")
                expect(response.fileContent).toInclude("lucee")
            })

            it("passes directory URLs to Lucee", () => {
                http url="http://cfml-in-docker.frontend/testroute/debug/" result="response";

                expect(response.status_code).toBe(200, "Expected to receive a 200-OK")
                expect(response.fileContent.trim()).toBe("/testroute/debug/")
            })
        })
    }
}
