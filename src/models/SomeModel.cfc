component extends=models.Model {

    function config() {
        property(name="name", label="Name")
        property(name="email", label="Email address")
        property(name="password", label="Password")

        validatesPresenceOf("name,email,password")
        validatesConfirmationOf(property="password", when="onCreate")
    }
}
