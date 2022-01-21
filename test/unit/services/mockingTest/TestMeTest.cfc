import testbox.system.BaseSpec
import cfmlInDocker.services.mockingTest.TestMe
import cfmlInDocker.services.mockingTest.DependOnMe

component extends=BaseSpec {
    function run() {
        describe("Tests for TestMe", () => {
            it("can spy on an 'unmocked' method", () => {
                dependOnMe = new DependOnMe()
                testMe = new TestMe(dependOnMe, "a private message", "a public message")

                prepareMock(testMe)
                testMe.$(
                    method = "spyOnMe",
                    callback = testMe["spyOnMe"]
                )

                result = testMe.callMe()
                expect(result).toBe([
                    "a public message",
                    "a private message",
                    "message from private method",
                    "message from DependOnMe"
                ])
                callLog = testMe.$callLog()

                expect(callLog).toHaveKey("spyOnMe")
                expect(callLog.spyOnMe).toHaveLength(1)
            })
        })
    }
}
