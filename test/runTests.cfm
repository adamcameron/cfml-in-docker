<cfscript>
    testBox = new testbox.system.TestBox(directory="cfmlInDocker.test")
    result = testBox.run(
        reporter = "testbox.system.reports.SimpleReporter"
    )
    writeOutput(result)
</cfscript>
