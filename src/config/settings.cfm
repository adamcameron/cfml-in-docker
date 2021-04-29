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

srcPrefix = "../src"

set(eventPath = "#srcPrefix#/events")
set(filePath = "#srcPrefix#/files")
set(modelPath = "#srcPrefix#/models")
set(modelComponentPath = "#srcPrefix#/models")
set(pluginPath = "#srcPrefix#/plugins")
set(pluginComponentPath = "#srcPrefix#/plugins")
set(viewPath = "#srcPrefix#/views")
set(controllerPath = "#srcPrefix#/controllers")

set(webPath = "")
set(imagePath = "images")
set(javascriptPath = "javascripts")
set(stylesheetPath = "stylesheets")

set(wheelsComponentPath = "cfmlInDocker.wheels")

//set(URLRewriting="On")
</cfscript>
