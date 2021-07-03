import cfmlInDocker.dao.MyDao
import cfmlInDocker.models.Thing
import testbox.system.BaseSpec

component extends=BaseSpec {

    function beforeAll() {
        variables.myOtherPluginFactory = application.wheels.plugins.MyOtherPlugin
        prepareMock(variables.myOtherPluginFactory)
        variables.myOtherPlugin = application.wheels.dispatch.MyOtherPlugin()
    }

    function run() {
        describe("Tests for MyOtherPlugin", () => {

            describe("Tests for selectThingById", () => {
                it("uses its DAO to fetch data values ", () => {
                    testValues = {
                        id = 42,
                        value = "wha tekau ma rua"
                    }

                    mockedDao = prepareMock(new MyDao(), true)
                    mockedDao
                        .$("selectThingById")
                        .$results(queryNew(""))

                    variables.myOtherPluginFactory.$property(propertyName="dao", mock=mockedDao)

                    expect(() => variables.myOtherPlugin.selectThingById(-1)).toThrow("ThingNotFoundException")

                    callLog = mockedDao.$callLog()
                    expect(callLog).toHaveKey("selectThingById")
                    expect(callLog.selectThingById).toHaveLength(1)
                    expect(callLog.selectThingById[1]).toBe([-1])
                })
            })

            describe("Tests for getVersion", () => {
                it("returns the expected version", () => {
                    expectedVersion = variables.myOtherPluginFactory.version

                    actualVersion = variables.myOtherPlugin.getVersion()

                    expect(expectedVersion).toBe(actualVersion)
                })
            })

            describe("Tests for getSecret", () => {
                it("returns the expected secret", () => {
                    secret = variables.myOtherPlugin.getSecret()

                    expect(secret).toBe("sssshhhh")
                })
            })
        })
    }
}
