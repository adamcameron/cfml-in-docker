component {

    this.log = {}

    function onMissingMethod(methodName, arguments) {
        this.log[methodName] = this.log[methodName] ?: []
        this.log[methodName].append(arguments.arguments)
    }
}
