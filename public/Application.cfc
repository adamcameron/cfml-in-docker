component  extends=cfmlInDocker.Application {

	function onApplicationStart() {
		super.onApplicationStart()
		fixBadIncludePaths()
	}

	private function fixBadIncludePaths() {

		/*
			framework erroneously assumes it's installed in the webroot for some reason
			also uses $include function with these paths which is hard-coded to skip up two directory levels
			but we need to skip up further, and across back into the code/public directories
		*/

		var srcPrefix = "../../src"
		var publicPrefix = "../../public"

		application.wheels.eventPath = "#srcPrefix#/events"
		application.wheels.filePath = "#srcPrefix#/files"
		application.wheels.imagePath = "#publicPrefix#/images"
		application.wheels.javascriptPath = "#publicPrefix#/javascripts"
		application.wheels.modelPath = "#srcPrefix#/models"
		application.wheels.modelComponentPath = "#srcPrefix#/models"
		application.wheels.pluginPath = "#srcPrefix#/plugins"
		application.wheels.pluginComponentPath = "#srcPrefix#/plugins"
		application.wheels.stylesheetPath = "#publicPrefix#/stylesheets"
		application.wheels.viewPath = "#srcPrefix#/views"
		application.wheels.controllerPath = "#srcPrefix#/controllers"
	}
}