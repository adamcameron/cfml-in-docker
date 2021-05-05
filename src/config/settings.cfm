<cfscript>
// Use this file to configure your application.
// You can also use the environment specific files (e.g. /config/production/settings.cfm) to override settings set here.
// Don't forget to issue a reload request (e.g. reload=true) after making changes.
// See http://docs.cfwheels.org/docs/configuration-and-defaults for more info.

// If you leave the settings below commented out, CFWheels will set the data source name to the same name as the folder the application resides in.
// set(dataSourceName="");
// set(dataSourceUserName="");
// set(dataSourcePassword="");

set(dataSourceName="cfmlInDocker")

set(eventPath = "../src/events")
set(filePath = "../src/files")
set(modelPath = "../src/models")
set(modelComponentPath = "../src/models")
set(pluginPath = "../src/plugins")
set(pluginComponentPath = "../src/plugins")
set(viewPath = "../src/views")
set(controllerPath = "/app/controllers")

set(webPath = "")
set(imagePath = "images")
set(javascriptPath = "javascripts")
set(stylesheetPath = "stylesheets")

set(wheelsComponentPath = "cfmlInDocker.wheels")

set(URLRewriting="On")
set(rewriteFile="index.cfm")
</cfscript>
