<!---
    Called by cfmlInDocker.test.functional.NginxProxyToLuceeTest
    which calls http://cfml-in-docker.frontend/testroute/debug/
--->
<cfoutput>EXPECT [#CGI.PATH_INFO#]</cfoutput>
