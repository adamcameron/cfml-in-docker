import testbox.system.BaseSpec
import cfmlInDocker.nonWheelsTests.mockExampleApp.*

component extends=BaseSpec {

    function beforeAll() {
        variables.mockedDao = prepareMock(object=new NumberDao(), callLogging=true)
        variables.numberController = new NumberController(new NumberFactory(variables.mockedDao))
    }

    function run() {
        describe("Testing handlePost variants", () => {
            it("passes the expected values to the DB", () => {
                variables.mockedDao.$(method="insert", calllogging=true)

                variables.numberController.handlePost({english="two", maori="rua"})

                callLog = variables.mockedDao.$callLog()

                writeDump(callLog)
            })
        })
    }
}
