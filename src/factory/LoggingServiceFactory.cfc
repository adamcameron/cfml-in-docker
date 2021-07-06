import cfmlInDocker.services.LoggingConfig
import logbox.system.logging.LogBox
import logbox.system.logging.config.LogBoxConfig

component {

    function getLoggingService() {
        config = new LoggingConfig()
        logBoxConfig = new LogBoxConfig(config)
        logBox = new LogBox(logBoxConfig)
        return logBox.getRootLogger()
    }
}
