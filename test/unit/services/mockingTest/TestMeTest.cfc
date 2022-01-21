import testbox.system.BaseSpec
import cfmlInDocker.services.mockingTest.TestMe

component extends=BaseSpec {
    function run() {
        describe("Tests for TestMe", () => {
            it("can spy on an 'unmocked' method", () => {
                testMe = new TestMe()
                expect(testMe).toBeInstanceOf("cfmlInDocker.services.mockingTest.TestMe")
            })
        })
    }
}
