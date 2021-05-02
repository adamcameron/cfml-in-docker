component {

	this.bufferOutput = true;

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

    this.localMode = "modern"

    this.setMappings()

    include "/wheels/functions.cfm";

    public function setMappings(){
        writeOutput("hi from base")

        thisDirectory = getDirectoryFromPath(getCurrentTemplatePath())
        this.mappings["/public/wheels"] =  getCanonicalPath("#thisDirectory#wheels")
        this.mappings["/public/tests"] = getCanonicalPath("#thisDirectory#../tests")
        this.mappings["/app/tests"] = getCanonicalPath("#thisDirectory#../tests")
    }
}
