component extends=cfmlInDocker.Application {

    this.mappings = {
        "/cfmlInDocker/test" = expandPath("/test"),
        "/testbox" = expandPath("/vendor/testbox")
    }

    this.localmode = "modern"

    this.datasources["cfmlInDocker"] = {
        type = "mysql",
        host = "database.backend",
        port = 3306,
        database = "cfmlindocker",
        username = "cfmlindocker",
        password = server.system.environment.MYSQL_PASSWORD,
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
