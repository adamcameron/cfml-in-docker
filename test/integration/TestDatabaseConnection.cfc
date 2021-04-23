component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests we can connect to the database", () => {
            it("can retrieve test records", () => {
                expectedRecords = queryNew("id,value", "int,varchar", [
                    [101, "Test row 1"],
                    [102, "Test row 2"]
                ])

                actualRecords = queryExecute("SELECT id, value FROM test ORDER BY id")
                
                expect(actualRecords).toBe(expectedRecords)
            })
        })
    }
}
