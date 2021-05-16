component extends=testbox.system.BaseSpec {

    function run() {
        describe("Test WheelsRequestRunner functionality", () => {

            runner = new test.WheelsRequestRunner()

            describe("controller tests",  () => {
                it("can execute a request and receive the expected response", () => {
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

                it("can test a 400 response", () => {
                    try{
                        result = runner.processRequest(
                            name = "testRoute",
                            params = {
                                controller = "testRoute",
                                action = "badRequest"
                            },
                            method = "get",
                            returnAs = "struct"
                        )

                        expect(result).toHaveKey("status")
                        expect(result.status).toBe(400)
                        expect(result).toHaveKey("body")
                        expect(result.body).toInclude("[400-BAD-REQUEST]")
                    } finally {
                        header statuscode=200;
                    }
                })
            })

            describe("model tests",  () => {
                it("can test a model", () => {
                    properties = {name="TEST_NAME", email="TEST_EMAIL", password="TEST_PASSWORD"}

                    model = runner.model("SomeModel")
                    testModel = model.new(properties)
                    expect(testModel).toBeInstanceOf("models.SomeModel")
                    expect(testModel.properties()).toBe(properties)
                })

                it("will report validation failures", () => {
                    properties = {
                        name = "VALID_NAME",
                        password="UNCONFIRMED_PASSWORD",
                        passwordConfirmation="MISMATCH"
                    }

                    model = runner.model("SomeModel")
                    testModel = model.create(properties)
                    expect(testModel.valid()).toBeFalse()

                    errors = testModel.allErrors()
                    expect(errors).toHaveLength(2)
                    expect(errors[1].message).toBe("Email address can't be empty")
                    expect(errors[2].message).toBe("Password should match confirmation")
                })
            })
        })
    }
}
