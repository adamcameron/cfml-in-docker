component  {

    function wireStuffIn(someObject, someMixin, mixinMap) {
        arguments.keyExists("mixinMap")
            ? mixinUsingMap(someObject, someMixin, mixinMap)
            : mixinUsingMixin(someObject, someMixin)
    }

    private function mixinUsingMixin(someObject, someMixin) {
        someObject.__putVariable = putIntoVariables
        structKeyArray(someMixin).each((methodName) => {
            someObject.__putVariable(someMixin[methodName], methodName)
        })
        structDelete(someObject, "__putVariable")
    }

    private function mixinUsingMap(someObject, someMixin, mixinMap) {
        someObject.__getVariables = getVariables
        scopes = {
            public = someObject,
            private = someObject.__getVariables()
        }
        structDelete(someObject, "__getVariables")

        mixinMap.each((sourceMethod, mapping) => {
            targetMethod = mapping.keyExists("target") ? mapping.target : sourceMethod
            requestedAccess = mapping.keyExists("access") ? mapping.access : "private"

            targetAccess = requestedAccess == "public" ? "public" : "private"

            scopes[targetAccess][targetMethod] = someMixin[sourceMethod]
        })
    }

    function getVariables(){
        return variables
    }

    function putIntoVariables(value, key){
        variables[key] = value
    }
}
