import testbox.system.BaseSpec
import cfmlInDocker.miscellaneous.static.Response

component extends=BaseSpec {

    function run() {
        describe("Tests for Response class", () => {
            describe("Tests for static constructor", () => {
                it("sets Response::HTTP_OK to be 200", () => {
                    expect(Response::HTTP_OK).toBe(200)
                })
                it("sets Response::HTTP_NOT_FOUND to be 404", () => {
                    expect(Response::HTTP_NOT_FOUND).toBe(404)
                })
            })

            describe("Tests for constructor", () => {
                it("creates an OK response", () => {
                    testContent = "some content"
                    response = new Response(testContent)

                    expect(response.status).toBe(Response::HTTP_OK)
                    expect(response.content).toBe(testContent)
                })
            })

            describe("Tests for createFromStruct", () => {
                it("returns a Response object with expected values", () => {
                    testValues = {
                        content = "couldn't find that",
                        status = Response::HTTP_NOT_FOUND
                    }
                    response = Response::createFromStruct(testValues)

                    expect(response.status).toBe(testValues.status)
                    expect(response.content).toBe(testValues.content)
                })
            })
        })
    }
}
