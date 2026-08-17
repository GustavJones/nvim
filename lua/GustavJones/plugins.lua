local functions = require("GustavJones.functions")
functions.AddPathToRuntimePath(functions.GetConfigSubdirectory("external/mason"))
functions.AddPathToRuntimePath(functions.GetConfigSubdirectory("external/nightfox"))

MASON = require("mason").setup()
MASON_REGISTRY = require("mason-registry")
