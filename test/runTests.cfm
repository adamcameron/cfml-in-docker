<cfscript>
	// runs the tests with either HTML output if we browse to this file, or as text if it's run from the shell
	reportFormat = url.keyExists("reportFormat") ? url.reportFormat : "SimpleReporter"

    testBox = new testbox.system.TestBox(directory="cfmlInDocker.test")
    result = testBox.run(
        reporter = "testbox.system.reports.#reportFormat#"
    )
    writeOutput(result)
</cfscript>
