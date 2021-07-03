import cfmlInDocker.services.LoggingService;

component extends=Controller {

    private function config() {
        setLoggingService()
    }

    function loggingTest() {
        variables.$class.logger.info("log message", {key="value"})

        writeDump(variables.$class.logger.log)
        abort;

        renderNothing()
    }

    private function setLoggingService() {
        variables.$class.logger = new LoggingService()
    }

}
