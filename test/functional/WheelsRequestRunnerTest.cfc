component extends=testbox.system.BaseSpec {

    function run() {
        describe("Test WheelsRequestRunner functionality", () => {
            it("can execute a request and receive the expected response", () => {
                runner = new test.WheelsRequestRunner()

                result = runner.processRequest(
                    params = {
                        controller = "testRoute",
                        action = "httpStatusOkTest"
                    },
                    method = "get",
                    returnAs = "struct"
                )

                expect(result).toHaveKey("status")
                expect(result.status).toBe(200)
                expect(result).toHaveKey("body")
                expect(result.body).toInclude("[200-OK]")
            })
        })
    }
}
