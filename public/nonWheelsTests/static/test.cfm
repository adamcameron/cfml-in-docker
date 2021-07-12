<cfscript>
    result = C::f(1,2,3)
    writeDump(result)

    o = new C()

    result = o.f(4,5,6)
    writeDump(result)
</cfscript>
