<cfscript>
    testBox = new testbox.system.TestBox(directory="cfmlInDocker.test")
    result = testBox.run(
        reporter = "testbox.system.reports.MinTextReporter"
    )
    writeOutput(result)
</cfscript>
