import cfmlInDocker.miscellaneous.mixins.*;
import cfmlInDocker.miscellaneous.mixins.runtime.*;

component extends=testbox.system.BaseSpec {

    function run() {
        describe("Testing mixin proofs of concept", () => {
            describe("Tests compile-time implementation of mix-ins", () => {
                it("mixes-in the required functions", () => {
                    model = new compileTime.MyModel()
                    result = model.executeSomeStuff()

                    expect(result).toBe("ExcellentCool")
                })
            })

            describe("Tests run-time simple implementation of mix-ins", () => {
                it("mixes-in the required functions", () => {
                    di = new simple.DependencyInjectionImplementor()
                    model = new simple.MyModel()
                    di.wireStuffIn(model, new simple.MyExcellentLib())
                    di.wireStuffIn(model, new simple.MyCoolLib())

                    result = model.executeSomeStuff()

                    expect(result).toBe("ExcellentCool")
                })
            })
        })
    }
}
