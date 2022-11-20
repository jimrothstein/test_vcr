#
#
#---------------------------------------------------------------------------------------------
#		REF
#---------------------------------------------------------------------------------------------
#
#
#
the_pkg = "test_vcr"

library(pkgload)
if (isNamespaceLoaded("test_vcr")) {
	cat("unloading ... ns\n")
	pkgload::unload(package="test_vcr")
}

#	BEFORE load_all
	tinytest::expect_error(pkgload::help("pkgload"))
	tinytest::expect_false(pkgload::is_dev_package("test_vcr"))

# TODO:	check ns	
x  <- pkgload::load_all()

#	AFTER load_all
	tinytest::expect_true(pkgload::is_dev_package("test_vcr"))
	tinytest::expect_error(pkgload::help("pkgload"))


if (F)
	tinytest::run_test_file("inst/tinytest/test_pkgload.R")

