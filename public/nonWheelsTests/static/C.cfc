component {

    static {
        static.multiplier = new Multiplier()
    }

    public static function f(x, y, z) {
        var m = static.multiplier
        return arrayMap(arguments, (v) => m.double(v) * 2)
    }
}
