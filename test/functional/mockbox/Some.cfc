component {

    function $mockMe() {
        throw(type="MockFailureException", message="I was supposed to have been mocked-out")
    }
}
