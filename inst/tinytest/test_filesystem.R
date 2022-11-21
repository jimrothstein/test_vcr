#	test_filesystem.R
#
#
#		is.R6  returns TRUE if object is R6 object
#		is.R6Class returns TRUE if if object is R6 generator
#
#		FileSystem.R
#   SEE persisters-file.R

##	FileSystem is not exported 
FileSystem  <- vcr:::FileSystem$new()
vcr_configure(dir = tempdir())


##	R complains non-function
expect_error(FileSystem$new(file_name = "file4014931b21b.yml"))

expect_true(is.R6(FileSystem)) 
expect_false(is.R6Class(FileSystem)) 
#   aa <- FileSystem$new()
#   expect_is(aa,  "R6")
#   expect_is(aa,  "FileSystem")
#   expect_null(aa$content)
#   expect_null(aa$file_name)
#   expect_is(aa$get_cassette,  "function")
#   expect_false(aa$write2disk)
#   expect_null(aa$write_fxn)

# test_that("FileSystem fails well", {
#   expect_error(FileSystem$new(a = 5), "unused argument")
# 
#   z <- FileSystem$new()
#   expect_error(z$get_cassette(), "No file name provided")
#   expect_error(z$is_empty(), "No file name provided")
#   expect_error(z$set_cassette(), "No file name provided")
# })
#
#
res  <- Cassette$new(name="bob")
expect_false(is.R6Class(res))
expect_true(is.R6(res))
