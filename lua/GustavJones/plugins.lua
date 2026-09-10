local functions = require("GustavJones.functions")
functions.add_path_to_runtime_path(functions.get_config_subdirectory("external/mason"))
functions.add_path_to_runtime_path(functions.get_config_subdirectory("external/nightfox"))

MASON = require("mason").setup()
MASON_REGISTRY = require("mason-registry")
