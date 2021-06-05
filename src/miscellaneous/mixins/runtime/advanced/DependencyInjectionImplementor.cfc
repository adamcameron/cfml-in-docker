component  {

    function wireStuffIn(someObject, someMixin, mixinMap) {
        someObject.__putVariable = putIntoVariables

        functionsToMixin = arguments.keyExists("mixinMap")
            ? mixinMap
            : structKeyArray(someMixin)

        functionsToMixin.each((methodName) => {
            someObject.__putVariable(someMixin[methodName], methodName)
        })

        structDelete(someObject, "__putVariable")
    }

    function putIntoVariables(value, key){
        variables[key] = value
    }
}
