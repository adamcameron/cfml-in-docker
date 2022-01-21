import cfmlInDocker.services.mockingTest.DependOnMe

component {

    public function init(required DependOnMe dependOnMe, required string privateMessage, required string publicMessage) {
        variables.dependOnMe = arguments.dependOnMe
        variables.privateMessage = arguments.privateMessage
        this.publicMessage = arguments.publicMessage
    }

    public array function callMe() {
        return spyOnMe()
    }

    public array function spyOnMe() {
        return [
            this.publicMessage,
            variables.privateMessage,
            getPrivateMessage(),
            variables.dependOnMe.getMessage()
        ]
    }

    private string function getPrivateMessage() {
        return "message from private method"
    }

}
