component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests Nginx proxies CFML requests to Lucee", () => {
            it("proxies a CFM request to Lucee", () => {
                http url="http://cfml-in-docker.frontend/gdayWorld.cfm" result="response";

                expect(response.status_code).toBe( 200, "HTTP status code incorrect")
                expect(response.fileContent.trim()).toBe( "G'day world!", "Response body incorrect")
            })

            it("passes query values to Lucee", () => {
                http url="http://cfml-in-docker.frontend/queryTest.cfm?testParam=expectedValue" result="response";

                expect(response.status_code).toBe( 200, "HTTP status code incorrect")
                expect(response.fileContent.trim()).toBe( "expectedValue", "Query parameter value was incorrect")
            })

            it("passes the upstream remote address to Lucee", () => {
                http url="http://cfml-in-docker.lucee:8888/public/remoteAddrTest.cfm" result="response";
                expectedRemoteAddr = response.fileContent

                http url="http://cfml-in-docker.lucee:8888/public/remoteAddrTest.cfm" result="testResponse";
                actualRemoteAddr = testResponse.fileContent

                expect(actualRemoteAddr).toBe(expectedRemoteAddr, "Remote address was incorrect")
            })
        })
    }
}
