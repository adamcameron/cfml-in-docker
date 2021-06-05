import cfmlInDocker.miscellaneous.mixins.compileTime.MyModel;

component extends=testbox.system.BaseSpec {

    function run() {
        describe("Testing mixin proofs of concept", () => {
            describe("Tests compile-time implementation of mix-ins", () => {
                it("mixes-in the required functions", () => {
                    model = new MyModel()
                    result = model.executeSomeStuff()

                    expect(result).toBe("ExcellentCool")
                })
            })
        })
    }
}
