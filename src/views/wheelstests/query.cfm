<cfprocessingdirective suppressWhitespace="true">
<cfoutput>Expected query param value: [#URL.testParam ?: "VALUE NOT FOUND"#]</cfoutput>
<cfif !structKeyExists(URL, "testParam")>
    <cfdump var="#CGI#">
    <cfdump var="#URL#">
</cfif>
</cfprocessingdirective>
