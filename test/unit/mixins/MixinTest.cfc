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

            describe("Tests simple run-time implementation of mix-ins", () => {
                it("mixes-in the required functions", () => {
                    di = new simple.DependencyInjectionImplementor()
                    model = new simple.MyModel()
                    di.wireStuffIn(model, new simple.MyExcellentLib())
                    di.wireStuffIn(model, new simple.MyCoolLib())

                    result = model.executeSomeStuff()

                    expect(result).toBe("ExcellentCool")
                })
            })

            describe("Tests advanced run-time implementation of mix-ins", () => {
                it("mixes-in the required functions using simplest approach", () => {
                    di = new advanced.DependencyInjectionImplementor()
                    model = new advanced.MyModel()
                    di.wireStuffIn(model, new advanced.MyExcellentLib())
                    di.wireStuffIn(model, new advanced.MyCoolLib())

                    result = model.executeSomeStuff()

                    expect(result).toBe("ExcellentCool")
                })

                it("mixes-in a subset of functions from a lib", () => {
                    di = new advanced.DependencyInjectionImplementor()
                    model = new advanced.MyModel()
                    di.wireStuffIn(model, new advanced.MyBrilliantLib(), ["radiateBrilliance"])

                    result = model.executeSomethingBrilliant()
                    expect(result).toBe("brilliance")

                    expect(() => model.failAtDoingItBrilliantly()).toThrow(type="expression")
                })
            })
        })
    }
}
