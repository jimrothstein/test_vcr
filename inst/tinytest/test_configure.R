#
#
#---------------------------------------------------------------------------------------------
#		REF
#		TESTS:		configure.R
#
#---------------------------------------------------------------------------------------------
if (F) {
	as.data.frame(tinytest::run_test_file("inst/tinytest/test_configure.R")	)
}

#
library(vcr)
library(R6)

search() 
loadedNamespaces()


##	from vcr_configure help:
the_dir = "inst/tinytest/"

# use write_disk_path/fixtures
cassette_dir = paste0(the_dir, "fixtures")
file_dirs =		 paste0(the_dir, "files")
#
#	# teardown (TODO ...)
tinytest::expect_true(vcr_configure_reset())
# vcr_configure(dir=tmpdir, write_disk_path = file.path(tmpdir, "files"))
vcr_configure(dir=the_dir,  write_disk_path = file_dirs)

#	return current configuration and test
cl  <- vcr_configuration()
	tinytest::expect_true(is.R6(cl))
  expect_false(is.R6Class(cl))
  expect_true(all(class(cl) %in% c("VCRConfig", "R6")))


#	test constructor 
VCRConfig  <- R6::R6Class("VCRConfig")$new()
expect_false(is.R6Class("VCRConfig"))
expect_true(is.R6(VCRConfig))


#	test fails well, infert
expect_warning(
  expect_error( vcr_configure(record = "asdfadfs", 
		info = "'record' value of 'asdfadfs' is not in the allowed set")
	)
)
#

#		test config fails well with invalid request matchers
##	    TODO:   check test_that syntax   Who handles error:  vcr_configure or testthat_expect_error
##	
  tinytest::expect_error(
	expect_warning(
    vcr_configure(match_requests_on = "x",
    "1 or more 'match_requests_on' values \\(x\\) is not in the allowed set"
  )
)
)

##  
## test_
# test vcr_configure() only affects settings passed	as arguments 
# use vcr:::vcr_c to access this internal object vcr_configure_reset()
	vcr_configure(dir="olddir", record="none")
  config1  <- vcr:::vcr_c$clone()

	vcr_configure(dir="newdir")
	config2  <- vcr:::vcr_c$clone()

	expect_equal(config1$record, "none")
	expect_equal(config2$record, "none")
tinytest::exit_file("tinytest is stopping")
  	
#	------------------------
##			LEGACY
#	------------------------
if (F){
context("Configuration")

teardown({
  vcr_configure_reset()
  vcr_configure(dir = tmpdir, write_disk_path = file.path(tmpdir, "files"))
})

test_that("VCRConfig", {
  expect_is(VCRConfig, "R6ClassGenerator")
  cl <- vcr_configuration()
  expect_is(cl,  "R6")
  expect_is(cl,  "VCRConfig")
})

test_that("config fails well with invalid record mode", {
  expect_error(
    vcr_configure(record = "asdfadfs"),
    "'record' value of 'asdfadfs' is not in the allowed set"
  )
})

test_that("config fails well with invalid request matchers", {
  expect_error(
    vcr_configure(match_requests_on = "x"),
    "1 or more 'match_requests_on' values \\(x\\) is not in the allowed set"
  )
})

test_that("vcr_configure() only affects settings passed as arguments", {
  vcr_configure_reset()
  vcr_configure(dir = "olddir", record = "none")
  config1 <- vcr_c$clone()

  vcr_configure(dir = "newdir")
  config2 <- vcr_c$clone()

  expect_equal(config1$dir, "olddir")
  expect_equal(config2$dir, "newdir")

  expect_equal(config1$record, "none")
  expect_equal(config2$record, "none")
})

test_that("warnings are thrown for invalid parameters", {
  expect_warning(
    vcr_configure(foo = "bar"),
    "The following configuration parameters are not valid"
  )
})

test_that("all configuration params are documented", {
  rd_file <- "../../man/vcr_configure.Rd"
  skip_if_not(file.exists(rd_file), sprintf("Did not find: '%s'", rd_file))

  rd_args <- extract_vcr_config_args(rd_file)
  fn_args <- names(VCRConfig$new()$as_list())

  expect_setequal(rd_args, fn_args)
})


}  # end all legacy code
