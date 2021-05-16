component extends=cfmlInDocker.Application {

    currentDir =getDirectoryFromPath(getCurrentTemplatePath())
    this.mappings["/cfmlInDocker/test"] = currentDir
    this.mappings["/testbox"] = getCanonicalPath("#currentDir#../vendor/testbox")

    this.localmode = "modern"

    this.datasources["cfmlInDocker"] = {
        type = "mysql",
        host = "database.backend",
        port = 3306,
        database = "cfmlindocker",
        username = "cfmlindocker",
        password = server.system.environment.MARIADB_PASSWORD,
        custom = {
            useUnicode = true,
            characterEncoding = "UTF-8"
        }
    }
    this.datasource = "cfmlInDocker"

    function onRequestEnd() {
        // just block CFWheel's one
    }
}
