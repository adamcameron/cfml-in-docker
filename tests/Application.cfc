component extends=cfmlInDocker.Application  {

    public function setMappings(){
        writeOutput("hi from sub")

        super.setMappings()
        thisDirectory = getCanonicalPath(getDirectoryFromPath(getCurrentTemplatePath()))

        this.mappings["/public/tests"] = thisDirectory
        this.mappings["/app/tests"] = thisDirectory
    }

}
