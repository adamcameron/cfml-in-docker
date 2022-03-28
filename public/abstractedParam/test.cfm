<cfset week = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"Monday","Rāhina"],
	[2,"Tuesday","Rātū"],
	[3,"Wednesday","Rāapa"],
	[4,"Thursday","Rāpare"],
	[5,"Friday","Rāmere"],
	[6,"Saturday","Rāhoroi"],
	[7,"Sunday","Rātapu"]
])>

<cfquery name="weekend" dbtype="query">
    SELECT  *
    FROM week
    WHERE en IN (<cfset paramAttributes = {value="Saturday,Sunday", list=true, cfsqltype="CF_SQL_VARCHAR"}><cfinclude template="includeParam.cfm">)
</cfquery>

<cfdump var="#weekend#">
