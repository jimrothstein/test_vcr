#
#
#---------------------------------------------------------------------------------------------
#		PURPOSE:  Use package pkgload to for tests on package vcr itself (load, unload ...)tests on package vcr itself (load, unload ...)
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

#	BEFORE load_all, but FAILS if load_all() ran
	expect_error(pkgload::help("pkgload"))
	#expect_false(pkgload::is_dev_package("testVCR"))

# TODO:	check ns	
x  <- pkgload::load_all()

#	AFTER load_all
	expect_true(pkgload::is_dev_package("testVCR"))
  expect_error(pkgload::help("pkgload"))

#	run test_pkgload.R
if (F)
	run_test_file("inst/tinytest/test_pkgload.R")

