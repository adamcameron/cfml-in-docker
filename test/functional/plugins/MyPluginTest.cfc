import cfmlInDocker.dao.MyDao
import cfmlInDocker.models.Thing
import testbox.system.BaseSpec

component extends=BaseSpec {

    function beforeAll() {
        variables.myPlugin = application.wheels.plugins.myPlugin
        prepareMock(variables.myPlugin)
    }

    function run() {
        describe("Tests for MyPlugin", () => {

            describe("Tests for selectThingById", () => {
                it("uses its DAO to fetch data values ", () => {
                    testValues = {
                        id = 42,
                        value = "wha tekau ma rua"
                    }

                    mockedDao = prepareMock(new MyDao(), true)
                    mockedDao
                        .$("selectThingById")
                        .$results(queryNew(
                            "id,name",
                            "integer,varchar",
                            [[testValues.id, testValues.value]]
                        ))

                    variables.myPlugin.$property(propertyName="dao", mock=mockedDao)

                    thing = application.wheels.dispatch.selectThingById(-1)

                    callLog = mockedDao.$callLog()
                    expect(callLog).toHaveKey("selectThingById")
                    expect(callLog.selectThingById).toHaveLength(1)
                    expect(callLog.selectThingById[1]).toBe([-1])

                    expect(thing).toBe(new Thing(testValues.id, testValues.value))
                })
            })

            describe("Tests for getVersion", () => {
                it("returns the expected version", () => {
                    expectedVersion = variables.myPlugin.version

                    actualVersion = application.wheels.dispatch.getVersion()

                    expect(expectedVersion).toBe(actualVersion)
                })
            })

            describe("Tests for getSecret", () => {
                it("returns the expected secret", () => {
                    secret = application.wheels.dispatch.getSecret()

                    expect(secret).toBe("sssshhhh")
                })
            })
        })
    }
}
