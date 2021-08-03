component extends=testbox.system.BaseSpec {

    function run() {
        describe("Baseline TestBox tests", () => {
            it("can verify that true is, indeed, true", () => {
                expect(true).toBe(true)
            })

            it("fails a test so I can check exit code", () => {
                expect(true).toBe(false)
            })
        })

        describe("Stub tests to be analysed by 'tests beforeEach and afterEach'", () => {
            variables.beforeAndAfterEachLog = []
            beforeEach(() => {
                variables.beforeAndAfterEachLog.append("beforeEach called")
            })
            afterEach(() => {
                variables.beforeAndAfterEachLog.append("afterEach called")
            })
            it("should be called between the beforeEach/afterEach event handlers", () => {
                variables.beforeAndAfterEachLog.append("test called")
                expect(true).toBeTrue()
            })
        })

        describe("Stub tests to be analysed by 'tests aroundEach'", () => {
            variables.aroundEachLog = []
            aroundEach((spec) => {
                variables.aroundEachLog.append("top of aroundEach called")
                spec.body()
                variables.aroundEachLog.append("bottom of aroundEach called")
            })
            it("should be called within the aroundEach event handler", () => {
                variables.aroundEachLog.append("test called")
                expect(true).toBeTrue()
            })
        })

        describe("outer container for nested aroundEach test", () => {
            variables.nestedAroundEachLog = []
            aroundEach((spec) => {
                variables.nestedAroundEachLog.append("top of outer aroundEach called")
                spec.body()
                variables.nestedAroundEachLog.append("bottom of outer aroundEach called")
            })

            describe("inner container for nested aroundEach test", () => {
                aroundEach((spec) => {
                    variables.nestedAroundEachLog.append("top of inner aroundEach called")
                    spec.body()
                    variables.nestedAroundEachLog.append("bottom of inner aroundEach called")
                })
                it("should be called within both the aroundEach event handler", () => {
                    variables.nestedAroundEachLog.append("test called")
                    expect(true).toBeTrue()
                })
            })
        })

        describe("Test lifecycle methods", () =>{
            it("tests beforeEach and afterEach", () => {
                expect(variables).toHaveKey("beforeAndAfterEachLog")
                expect(beforeAndAfterEachLog).toBe([
                    "beforeEach called",
                    "test called",
                    "afterEach called"
                ])
            })

            it("tests aroundEach", () => {
                expect(variables).toHaveKey("aroundEachLog")
                expect(aroundEachLog).toBe([
                    "top of aroundEach called",
                    "test called",
                    "bottom of aroundEach called"
                ])
            })

            it("tests nested aroundEach", () => {
                expect(variables).toHaveKey("nestedAroundEachLog")
                expect(nestedAroundEachLog).toBe([
                    "top of outer aroundEach called",
                    "top of inner aroundEach called",
                    "test called",
                    "bottom of inner aroundEach called",
                    "bottom of outer aroundEach called"
                ])
            })
        })
    }
}
