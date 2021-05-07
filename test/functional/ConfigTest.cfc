component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests Lucee's config has been tweaked", () => {
            it("has 'Local scope mode' set to 'modern'", () => {
            	testVariable = "value"

                expect(variables).notToHaveKey("testVariable", "testVariable should not be set in variables scope")
                expect(local).toHaveKey("testVariable", "testVariable should be set in local scope")
            })
        })
    }
}
