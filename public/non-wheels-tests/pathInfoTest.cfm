<cfprocessingdirective suppressWhitespace="true">
<cfoutput>Expected PATH_INFO: [#CGI.PATH_INFO#]</cfoutput>
<cfif structCount(URL)>
    <cfoutput>Expected query param value: [#URL.testParam ?: "VALUE NOT FOUND"#]</cfoutput>
</cfif>
</cfprocessingdirective>
