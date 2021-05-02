<cfprocessingdirective suppressWhitespace="true">
<cfoutput>Expected test response: [#CGI.script_name#][#CGI.PATH_INFO#]</cfoutput>
<cfif structCount(URL)>
    <cfoutput>Expected query param value: [#URL.testParam ?: "VALUE NOT FOUND"#]</cfoutput>
</cfif>
</cfprocessingdirective>
