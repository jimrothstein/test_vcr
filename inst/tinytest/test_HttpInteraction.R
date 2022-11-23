library(vcr)
library(R6)

##  HttpInteraction
library(tinytest)
crul::mock(FALSE)   

  url <- "https://eu.httpbin.org/post"
  body <- list(foo = "bar")
  cli <- crul::HttpClient$new(url = url)
  res <- cli$post(body = body)

  # request (since vcr is `imports`  it is loaded, not attached ) 
  request <- vcr::Request$new("POST", uri = url,
    body = body, headers = res$response_headers)
  # response
  response <- vcr::VcrResponse$new(
     res$status_http(),
     res$response_headers,
     res$parse("UTF-8"),
     res$response_headers$status)

  x <- vcr::HTTPInteraction$new(request = request, response = response)


  # timestamp
  expect_inherits(x, "HTTPInteraction")
  expect_true(R6::is.R6(x))
  class(x$recorded_at)
  expect_inherits(x$recorded_at, 'POSIXct')
  expect_true(typeof(x$recorded_at) == 'double')


  # methods and objects
  expect_true(is.function(x$to_hash))
  expect_true(is.function(x$from_hash)) 
  expect_inherits(x$request, "Request")
  expect_inherits(x$response, "VcrResponse")

  # to_hash method
  expect_true(is.list(x$to_hash())) 

  expect_identical(names(x$to_hash()), c('request', 'response', 'recorded_at'))

  # make an HTTPInteraction from a hash with the object already made
  expect_inherits(x$from_hash(x$to_hash()), "HTTPInteraction")

  # Make an HTTPInteraction from a hash alone
  my_hash <- x$to_hash()

  expect_true(any(class(HTTPInteraction$new()$from_hash(my_hash)) == "HTTPInteraction"))
  expect_inherits(HTTPInteraction$new()$from_hash(my_hash), "HTTPInteraction")





##  ------------------------------------------------------------------
##      LEGACY
##
##
##  ------------------------------------------------------------------
if (F) {
context("HttpInteraction")

test_that("HttpInteraction", {
  crul::mock(FALSE)

  url <- "https://eu.httpbin.org/post"
  body <- list(foo = "bar")
  cli <- crul::HttpClient$new(url = url)
  res <- cli$post(body = body)

  # request
  request <- Request$new("POST", uri = url,
    body = body, headers = res$response_headers)
  # response
  response <- VcrResponse$new(
     res$status_http(),
     res$response_headers,
     res$parse("UTF-8"),
     res$response_headers$status)

  x <- HTTPInteraction$new(request = request, response = response)

  # timestamp
  expect_is(x, "HTTPInteraction")
  expect_is(x$recorded_at, 'POSIXct')
  expect_type(x$recorded_at, 'double')

  # methods and objects
  expect_is(x$to_hash, "function")
  expect_is(x$from_hash, "function")
  expect_is(x$request, "Request")
  expect_is(x$response, "VcrResponse")

  # to_hash method
  expect_is(x$to_hash(), "list")
  expect_named(x$to_hash(), c('request', 'response', 'recorded_at'))

  # make an HTTPInteraction from a hash with the object already made
  expect_is(x$from_hash(x$to_hash()), "HTTPInteraction")

  # Make an HTTPInteraction from a hash alone
  my_hash <- x$to_hash()
  expect_is(HTTPInteraction$new()$from_hash(my_hash), "HTTPInteraction")
})
}
