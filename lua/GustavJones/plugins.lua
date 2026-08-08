local functions = require("GustavJones.functions")
functions.AddPathToRuntimePath(functions.GetConfigSubdirectory("external/mason"))
functions.AddPathToRuntimePath(functions.GetConfigSubdirectory("external/nightfox"))

require("mason").setup()
