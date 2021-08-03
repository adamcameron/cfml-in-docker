import testbox.system.BaseSpec
import cfmlInDocker.miscellaneous.static.Behaviour

component extends=BaseSpec {

    function run() {

        describe("Tests for Behaviour class", () => {
            afterEach(() => {
                Behaviour::resetMyVar()
            })

            it("resets the test variable when resetMyVar is called", () => {
                behaviour = new Behaviour()
                expect(behaviour.myVar).toBe("set in pseudo-constructor")
                expect(Behaviour::myVar).toBe("set in pseudo-constructor")
                Behaviour::resetMyVar()
                expect(behaviour.myVar).toBe("set in static constructor")
                expect(Behaviour::myVar).toBe("set in static constructor")
            })

            it("doesn't use the pseudo-constructor for static values using class reference", () => {
                expect(Behaviour::myVar).toBe("set in static constructor")
            })

            it("does use the pseudo-constructor for static values using object reference", () => {
                behaviour = new Behaviour()
                expect(behaviour.myVar).toBe("set in pseudo-constructor")
            })
        })
    }
}
