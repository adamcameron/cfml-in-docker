import testbox.system.BaseSpec
import cfmlInDocker.miscellaneous.static.Person

component extends=BaseSpec {

    function run() {
        describe("Tests for Person class", () => {
            describe("Tests for constructor", () => {
                it("creates the expected Person object", () => {
                    testFirstName = "Zachary"
                    testLastName = "Cameron Lynch"

                    person = new Person(testFirstName, testLastName)

                    expect(person.firstName).toBe(testFirstName)
                    expect(person.lastName).toBe(testLastName)
                })
            })

            describe("Tests for getById", () => {
                it("returns a Person object corresponding to the specified ID", () => {
                    expectedFirstName = "Zachary"
                    expectedLastName = "Cameron Lynch"
                    testId = 17

                    repository = createMock("cfmlInDocker.miscellaneous.static.PersonRepository")
                    repository.$("loadById").$args(testId).$results({firstName=expectedFirstName, lastName=expectedLastName})

                    personFactory = createObject("Person")
                    personFactory.setRepository(repository)

                    person = personFactory.getById(testId)

                    expect(person.firstName).toBe(expectedFirstName)
                    expect(person.lastName).toBe(expectedLastName)
                    expect(person.id).toBe(testId)
                })
            })
        })
    }
}
