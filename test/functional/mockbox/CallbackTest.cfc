component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests of mocking methods with a callback", () => {
            it("throws an exception when not mocked", () => {
                sut = new Some()
                expect(()=>sut.$mockMe()).toThrow(type="MockFailureException")
            })
            it("does not throw an exception when mocked-out", () => {
                sut = new Some()
                prepareMock(sut)
                sut.$(method="$mockMe")
                expect(()=>sut.$mockMe()).notToThrow(type="MockFailureException")
            })
            it("executes callback", () => {
                sut = new Some()
                prepareMock(sut)
                sut.$(method="$mockMe", callback=() => {
                    throw(type="ExpectedCallbackException", message="I was expected")
                })
                expect(()=>sut.$mockMe()).toThrow(type="ExpectedCallbackException")
            })
            it("executes callback when call-logging is being used", () => {
                sut = new Some()
                prepareMock(sut)
                st.callbackWasCalled = false
                sut.$(method="$mockMe", callLogging=true, callback=() =>  {
                    st.callbackWasCalled = true
                })

                sut.$mockMe()

                callLog = sut.$callLog()
                writeDump(callLog)
                expect(st.callbackWasCalled).toBeTrue()
                expect(callLog).toHaveKey("$mockMe")
                expect(callLog.$mockMe).toHaveLength(1)
            })
        })

        describe("Tests of mocking methods with a callback on a reused object", () => {
            preexistingSut = new Some()
            a = [1,2,3]
            a.each((pass) => {
                it("executes callback when call-logging is being used (pass #pass#)", () => {
                    prepareMock(preexistingSut)
                    st.callbackCount = 0
                    preexistingSut.$(method="$mockMe", callLogging=true, callback=() =>  {
                        st.callbackCount++
                    })

                    preexistingSut.$mockMe()

                    callLog = preexistingSut.$callLog()
                    expect(st.callbackCount).toBe(1)
                    expect(callLog).toHaveKey("$mockMe")
                    expect(callLog.$mockMe).toHaveLength(1)
                })
            })
        })
    }
}
