#------------------------------------------------------------
#		test_testing.R
#		PURPOSE:		examples tinytests I sometimes found non obvious
#------------------------------------------------------------

##	to test  
##	tinytest::run_test_file(file="inst/tinytest/test_testing.R")
##

expect_equal(1 + 1, 2)

##	misc
expect_silent(1+1)
expect_silent(print("abc"))
expect_silent(print("abc"), quiet=F)				# default is T


##	expect_warning
expect_warning(warning("this is a warning"))

## passes if run by itself
## FAILS when run with run_test_file()
#expect_warning(expect_error(warning("this is a warning")))    ## inner expect_error itself throws a warning
##	
##	expect_error
expect_error(1+"a")
expect_error(stop("an error"))
#expect_error(print(x))

##	todo  test if object exists or not


##	tinytests return?
ret  <- expect_equal(1+1,2)
ret
str(ret)
expect_true(is.atomic(ret))
class(ret)
expect_false(R6::is.R6(ret))


