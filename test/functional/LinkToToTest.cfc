component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests the linkTo function under different rewrite settings", () => {

            it("uses the URI when URLRewriting is on", () => {
                runner = new test.WheelsRequestRunner()
                runner.set(URLRewriting="On")

                result = runner.processRequest(
                    params = {
                        controller = "testRoute",
                        action = "linktotest"
                    },
                    method = "get",
                    returnAs = "struct"
                )

                expect(result).toHaveKey("body")
                expect(result.body).toMatch('<a\b[^>]*href="/testRoute/linkToTestTarget"[^>]*>')
            })

            xdescribe("other test variations that are currently broken due to potential CFWheels logic error in URL creation", () =>{
                it("uses the query string when URLRewriting is off", () => {
                    runner = new test.WheelsRequestRunner()
                    runner.set(URLRewriting="Off")

                    result = runner.processRequest(
                        params = {
                            controller = "testRoute",
                            action = "linktotest"
                        },
                        method = "get",
                        returnAs = "struct"
                    )

                    expect(result).toHaveKey("body")
                    expect(result.body).toMatch('<a\b[^>]*href="\/index\.cfm\?controller=testRoute&action=linkToTestTarget"[^>]*>')
                })

                it("uses PATH_INFO when URLRewriting is partial", () => {
                    runner = new test.WheelsRequestRunner()
                    runner.set(URLRewriting="Partial")

                    result = runner.processRequest(
                        params = {
                            controller = "testRoute",
                            action = "linktotest"
                        },
                        method = "get",
                        returnAs = "struct"
                    )

                    expect(result).toHaveKey("body")
                    expect(result.body).toMatch('<a\b[^>]*href="/testRoute/linkToTestTarget"[^>]*>')
                })
            })
        })
    }
}
