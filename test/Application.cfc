component extends=cfmlInDocker.Application {

    this.name = "testApplication"

    currentDir = getDirectoryFromPath(getCurrentTemplatePath())
    this.mappings["/cfmlInDocker/test"] = currentDir
    this.mappings["/testbox"] = getCanonicalPath("#currentDir#../vendor/testbox")
}
