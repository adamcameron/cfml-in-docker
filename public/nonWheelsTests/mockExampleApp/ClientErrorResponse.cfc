// ClientErrorResponse.cfc
component extends=Response {
    function init(errors) {
        super.init(400)
        this.errors = arguments.errors
    }
}