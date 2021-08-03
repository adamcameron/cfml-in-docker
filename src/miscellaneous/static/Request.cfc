component {

    public function init(url, form) {
        this.url = arguments.url
        this.form = arguments.form
    }

    public static Request function createFromScopes() {
        return new Request(url, form)
    }
}
