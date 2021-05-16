component extends=testbox.system.BaseSpec {

    function run() {
        describe("Test SomeModel's DB integration", () => {

            runner = new test.WheelsRequestRunner()

            describe("model tests",  () => {
                aroundEach((spec) => {
                    originalTransactionState = runner.get("transactionMode")
                    runner.set(transactionMode="none")
                    transaction {
                        try {
                            spec.body()
                        } finally {
                            transaction action="rollback";
                            runner.set(transactionMode=originalTransactionState)
                        }
                    }
                })

                it("will save an object to the database", () => {
                    properties = {
                        name = "VALID_NAME",
                        email = "VALID_EMAIL",
                        password="VALID_PASSWORD",
                        passwordConfirmation="VALID_PASSWORD"
                    }

                    model = runner.model("SomeModel")
                    testModel = model.create(properties)

                    expect(testModel.valid()).toBeTrue()
                    errors = testModel.allErrors()
                    expect(errors).toHaveLength(0)
                    expect(testModel).toHaveKey("id")
                    expect(testModel.id).toBeInteger()

                    record = queryExecute("SELECT name, email, password FROM somemodels WHERE id = :id", {id=testModel.id})
                    expect(record).toHaveLength(1)
                    expect([
                        testModel.name,
                        testModel.email,
                        testModel.password
                    ]).toBe([
                        record.name,
                        record.email,
                        record.password
                    ])
                })
            })
        })
    }
}
