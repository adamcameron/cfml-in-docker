<cfscript>
// Place code here that should be executed on the "onApplicationStart" event.

function initIocContainer() {
    application.container = new fw1.ioc(["/cfmlInDocker/factory"])
    application.container.declare("loggingService").fromFactory("LoggingServiceFactory", "getLoggingService").asSingleton()
}
initIocContainer()
</cfscript>
