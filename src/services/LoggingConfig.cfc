import logbox.system.logging.config.LogBoxConfig

component {

    function configure(){
        variables.logBox = {
            appenders = {
                ScopeAppender = {
                    class="logbox.system.logging.appenders.ScopeAppender",
                    properties={
                        scope="request",
                        key="log"
                    }
                }
            },
            root = {
                appenders="*"
            }
        }
    }
}
