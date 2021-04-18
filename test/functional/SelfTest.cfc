component extends=testbox.system.BaseSpec {

    function run() {
        describe("Baseline TestBox tests", () => {
            it("can verify that true is, indeed, true", () => {
                expect(true).toBe(true)
            })
        })
    }
}
