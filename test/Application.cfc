component extends=cfmlInDocker.Application {

    this.name = "testApplication"

    currentDir = getDirectoryFromPath(getCurrentTemplatePath())
    this.mappings["/cfmlInDocker/test"] = currentDir
    this.mappings["/testbox"] = getCanonicalPath("#currentDir#../vendor/testbox")

    this.localmode = "modern"

    this.datasource = "cfmlInDocker"

    function onApplicationStart() {
        super.onApplicationStart()
        set(rewriteFile="runTests.cfm")
    }

    function onRequestEnd() {
        // just block CFWheel's one
    }
}
