component {

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

    this.localMode = "modern"
}
