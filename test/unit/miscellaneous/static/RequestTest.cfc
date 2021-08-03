import testbox.system.BaseSpec
import cfmlInDocker.miscellaneous.static.Request

component extends=BaseSpec {

    function run() {
        describe("Tests for Request class", () => {
            describe("Tests for constructor", () => {
                it("creates the expected Request object", () => {
                    testUrlParameters = {
                        queryParam = "query_param_value"
                    }
                    testFormParameters = {
                        formField = "form_field_value"
                    }

                    testRequest = new Request(testUrlParameters, testFormParameters)

                    expect(testRequest.url).toBe(testUrlParameters)
                    expect(testRequest.form).toBe(testFormParameters)
                })
            })

            describe("Tests for createFromScopes", () => {
                it("returns a Request object populated by url and form scopes", () => {
                    url.testParam = "url_test_value"
                    form.testParam = "form_test_value"

                    testRequest = Request::createFromScopes()

                    expect(testRequest.url).toBe(url)
                    expect(testRequest.form).toBe(form)
                })
            })
        })
    }
}
