component  {

    function wireStuffIn(someObject, someMixin, mixinMap) {
        someObject.__putVariable = putIntoVariables

        arguments.keyExists("mixinMap")
            ? mixinUsingMap(someObject, someMixin, mixinMap)
            : mixinUsingMixin(someObject, someMixin)

        structDelete(someObject, "__putVariable")
    }

    private function mixinUsingMixin(someObject, someMixin) {
        structKeyArray(someMixin).each((methodName) => {
            someObject.__putVariable(someMixin[methodName], methodName)
        })
    }

    private function mixinUsingMap(someObject, someMixin, mixinMap) {
        mixinMap.each((sourceMethod, mapping) => {
            targetMethod = mapping.keyExists("target") ? mapping.target : sourceMethod
            someObject.__putVariable(someMixin[sourceMethod], targetMethod)
        })
    }

    function putIntoVariables(value, key){
        variables[key] = value
    }
}
