component {

    static {
        static.defaultMyVarValue = "set in static constructor"
        static.myVar = static.defaultMyVarValue
    }

    static.myVar = "set in pseudo-constructor"

    public static function resetMyVar() {
        static.myVar = static.defaultMyVarValue
    }
}
