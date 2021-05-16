component extends=cfmlInDocker.Application {

    currentDir = getDirectoryFromPath(getCurrentTemplatePath())
    this.mappings["/cfmlInDocker/test"] = currentDir
    this.mappings["/testbox"] = getCanonicalPath("#currentDir#../vendor/testbox")

    this.localmode = "modern"

    this.datasource = "cfmlInDocker"

    function onRequestEnd() {
        // just block CFWheel's one
    }
}
