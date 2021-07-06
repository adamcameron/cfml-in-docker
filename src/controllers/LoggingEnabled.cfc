component extends=Controller {

    private function config() {
        setLoggingService()
    }

    function loggingTest() {
        variables.$class.logger.info("log message", {key="value"})

        renderNothing()
    }

    private function setLoggingService() {
        variables.$class.logger = application.container.getBean("loggingService")
    }

}
