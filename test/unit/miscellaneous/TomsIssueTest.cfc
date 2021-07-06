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
        })
    }
}
