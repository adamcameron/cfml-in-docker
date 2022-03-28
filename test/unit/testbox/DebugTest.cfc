import testbox.system.BaseSpec
import cfmlInDocker.services.testboxTest.DebugTester

component extends=BaseSpec {

	function run() {
		describe("Testing request.testbox.debug", () => {
			it("should write to debug buffer", () => {
				request.testbox.debug("hi?")

				expect(this.$debugBuffer).toHaveLength(1)
				expect(this.$debugBuffer[1].data).toBe("hi?")
			})

			fit("should write to debug buffer when called from a SUT", () => {
				sut = new DebugTester()
				sut.testMe()

				messagesOnly = request.testbox.getDebugBuffer().map((debugEntry) => debugEntry.data)

				expect(messagesOnly).toHaveLength(3)
				expect(messagesOnly).toBe([
					//"in static constructor",
					"in pseudo constructor",
					"in constructor",
					"in method"
				])
			})
		})
	}
}
