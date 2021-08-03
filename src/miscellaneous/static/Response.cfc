component {

    static {
        static.HTTP_OK = 200
        static.HTTP_NOT_FOUND = 404
    }

    public function init(required string content, numeric status=Response::HTTP_OK) {
        this.content = arguments.content
        this.status = arguments.status
    }

    public static function createFromStruct(required struct values) {
        return new Response(values.content, values.status)
    }
}
