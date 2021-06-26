import testbox.system.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests for ColourPlugin", () => {
            it("does not pollute the application with implementation methods", () => {
                expect(application.wheels.dispatch).toHaveKey("ColourPlugin")
                expect(application.wheels.dispatch).notToHaveKey("getColourById")
            })
        })
    }
}
