component {

	this.bufferOutput = true;

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

    this.localMode = "modern"

    thisDirectory = getDirectoryFromPath(getCurrentTemplatePath())
    this.mappings["/public/wheels"] =  getCanonicalPath("#thisDirectory#wheels")
    this.mappings["/app/wheels"] = getCanonicalPath("#thisDirectory#wheels")

    this.mappings["/app/controllers"] = getCanonicalPath("#thisDirectory#controllers")
    this.mappings["/app/models"] = getCanonicalPath("#thisDirectory#models")
    this.mappings["/app/events"] = getCanonicalPath("#thisDirectory#events")
    this.mappings["/app/files"] = getCanonicalPath("#thisDirectory#files")
    this.mappings["/app/plugins"] = getCanonicalPath("#thisDirectory#plugins")
    this.mappings["/app/views"] = getCanonicalPath("#thisDirectory#views")

    this.mappings["/models"] = getCanonicalPath("#thisDirectory#models")

    this.mappgins["/logbox"] = getCanonicalPath("#thisDirectory#../vendor/logbox")
    this.mappgins["/fw1"] = getCanonicalPath("#thisDirectory#../vendor/fw1")


    testDirectory = getCanonicalPath("#thisDirectory#../tests")
    this.mappings["/public/tests"] = testDirectory
    this.mappings["/app/tests"] = testDirectory
    this.mappings["/tests"] = testDirectory

    include "/wheels/functions.cfm";
}
