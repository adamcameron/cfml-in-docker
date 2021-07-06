component extends=testbox.system.BaseSpec {

    function run() {
        describe("Testing Tom's function", () => {
            it("fulfils the requirement of the puzzle", () => {
                input = {
                    "payment_method_types" = ["card"],
                    "line_items" = [
                        {
                            "price_data" = {
                                "product_data" = {
                                    "name" = "Something"
                                },
                                "currency" = "gbp",
                                "unit_amount" = 123
                            },
                            "quantity" = 1
                        }
                    ]
                }
                expected = {
                    "payment_method_types[0]" = "card",
                    "line_items[0][price_data][product_data][name]" = "Something",
                    "line_items[0][price_data][currency]" = "gbp",
                    "line_items[0][price_data][unit_amount]" = 123,
                    "line_items[0][quantity]" = 1
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles top-level key/values with simple values", () => {
                input = {
                    "one" = "tahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    }
                }
                expected = {
                    "[one]" = "tahi",
                    "[two][second]" = "rua",
                    "[three][third][thrice]" = "toru"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles multiple top-level key/values with simple values", () => {
                input = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    }
                }
                expected = {
                    "[one]" = "tahi",
                    "[first]" = "tuatahi",
                    "[two][second]" = "rua",
                    "[three][third][thrice]" = "toru"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles structs", () => {
                input = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    }
                }
                expected = {
                    "[one]" = "tahi",
                    "[first]" = "tuatahi",
                    "[two][second]" = "rua",
                    "[three][third][thrice]" = "toru"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles arrays values", () => {
                input = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    },
                    "four" = ["fourth", "quaternary", "wha", "tuawha"]
                }
                expected = {
                    "[one]" = "tahi",
                    "[first]" = "tuatahi",
                    "[two][second]" = "rua",
                    "[three][third][thrice]" = "toru",
                    "[four][1]" = "fourth",
                    "[four][2]" = "quaternary",
                    "[four][3]" = "wha",
                    "[four][4]" = "tuawha"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })
        })
    }

    function flattenStruct(required struct struct) {
        flatten = (flattened, key, value, _, prefix="") => {
            var prefixedKey = "#prefix#[#key#]"
            if (isSimpleValue(value)) {
                return flattened.append({"#prefixedKey#" = value})
            }

            if (isStruct(value)) {
                return flattened.append(value.reduce(
                    function (flattened={}, key, value, _, prefix=prefixedKey) {
                        return flattened.append(flatten(flattened, key, value, _, prefix))
                    },
                    {}
                ))
            }
            if (isArray(value)) {
                return flattened.append(value.reduce(
                    function (flattened={}, value, index, _, prefix=prefixedKey) {
                        return flattened.append(flatten(flattened, index, value, _, prefix))
                    },
                    {}
                ))
            }
        }

        return struct.reduce(flatten, {})
    }
}
