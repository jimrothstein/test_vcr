#
		#PURPOSE:	This tests namespace and imports.  It is not essential.#
#
#---------------------------------------------------------------------------------------------
#		REF
#		https://stackoverflow.com/questions/8637993/better-explanation-of-when-to-use-imports-depends
#---------------------------------------------------------------------------------------------
#	claims namespace is sealed ?
#namespaceExport()
#-----------------------
#	Why is R6 not loaded?
#-----------------------
attached  <- search()
attached
loaded  <- loadedNamespaces()
loaded


## Compare after load_all()
load_all()

##  compare
base::setdiff(search(), attached)
base::setdiff(loadedNamespaces(), loaded)

#-----------------------
ls(getNamespace("vcr"))

# claims vcr_test_path not on search list
expect_error(ls(getNamespaceExports("vcr")))
ls(getNamespaceImports("vcr"))

ls(getNamespace("tinytest"))
ls(getNamespace("R6"))

expect_warning(
	expect_error(ls(getNamespace(".")))
	)

ls(getNamespace("testVCR"))



#
#	-------------------------------------
#	namespace to environment?
#	-------------------------------------
e  <- as.environment("package:stats")
e
