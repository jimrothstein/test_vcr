#
#
#---------------------------------------------------------------------------------------------
#		REF
#		https://stackoverflow.com/questions/8637993/better-explanation-of-when-to-use-imports-depends
#---------------------------------------------------------------------------------------------
namespaceExport()
#-----------------------
#	Why is R6 not loaded?
#-----------------------
attached  <- search()
attached
loaded  <- loadedNamespaces()
loaded

load_all()
base::setdiff(search(), attached)
base::setdiff(loadedNamespaces(), loaded)

#-----------------------
ls(getNamespace("vcr"))
ls(getNamespaceExports("vcr"))
ls(getNamespaceImports("vcr"))

ls(getNamespace("tinytest"))
ls(getNamespace("R6"))


ls(getNamespace("."))
ls(getNamespace("test_vcr"))



#
#	-------------------------------------
#	namespace to environment?
#	-------------------------------------
e  <- as.environment("package:stats")
e
