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

                    expect(result).toBe("Excellent Cool")
                })
            })

            describe("Tests advanced run-time implementation of mix-ins", () => {
                it("mixes-in the required functions using simplest approach", () => {
                    di = new advanced.DependencyInjectionImplementor()
                    model = new advanced.MyModel()
                    di.wireStuffIn(model, new advanced.MyExcellentLib())
                    di.wireStuffIn(model, new advanced.MyCoolLib())

                    result = model.executeSomeStuff()

                    expect(result).toBe("Excellent Cool")
                })

                it("mixes-in a subset of functions from a lib", () => {
                    di = new advanced.DependencyInjectionImplementor()
                    model = new advanced.MyModel()
                    di.wireStuffIn(model, new advanced.MyBrilliantLib(), {"radiateBrilliance" = {}})

                    result = model.executeSomethingBrilliant()

                    expect(result).toBe("brilliance")
                    expect(() => model.failAtDoingItBrilliantly()).toThrow(type="expression")
                })

                it("remaps function names if the map specifies it", () => {
                    di = new advanced.DependencyInjectionImplementor()
                    model = new advanced.MyModel()
                    di.wireStuffIn(
                        model,
                        new advanced.MyBrilliantLib(),
                        {
                            "radiateBrilliance" = {target="shine"},
                            "doItBrilliantly" = {}
                        }
                    )

                    result = model.performBrilliantThings()
                    expect(result).toBe("brilliance done brilliantly")
                })

                it("handles public/private method access on the mixed-in function", () => {
                    di = new advanced.DependencyInjectionImplementor()
                    model = new advanced.MyModel()
                    di.wireStuffIn(
                        model,
                        new advanced.MyBestLib(),
                        {
                            improveGoodness = {target="makeItBetter"},
                            makeBest = {access="public"}
                        }
                    )

                    result = model.executeSomeOtherStuff()
                    expect(result).toBe("better best")

                    expect(() => model.makeItBetter()).toThrow(type="expression")
                })

                it("ignores access modifiers other than public / private (falling back to private)" , () => {
                    di = new advanced.DependencyInjectionImplementor()
                    model = new advanced.MyModel()
                    di.wireStuffIn(
                        model,
                        new advanced.MyBestLib(),
                        {
                            makeBest = {access="INVALID"}
                        }
                    )

                    result = model.checkIfItsTheBest()

                    expect(result).toBe("best")
                    expect(() => model.makeBest()).toThrow(type="expression")
                })

                it("handles subset / renames / modifiers (good/bad)", () => {
                    di = new advanced.DependencyInjectionImplementor()
                    model = new advanced.MyModel()
                    di.wireStuffIn(
                        model,
                        new advanced.MyUltimateLib(),
                        {
                            startAsEpic : {target="startOff"},
                            progressToBeLegendary: {access="public"},
                            retireAsMythic : {target="complete", access="PROTECTED"}
                        }
                    )

                    result = model.progressStatus()

                    expect(result).toBe("epic legendary mythic")
                    expect(() => model.startAsEpic()).toThrow(type="expression")
                    expect(() => model.complete()).toThrow(type="expression")
                    expect(() => model.revert()).toThrow(type="expression")
                })
            })
        })
    }
}
