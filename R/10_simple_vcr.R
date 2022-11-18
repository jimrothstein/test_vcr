
OLD  <- search()

library(vcr)
library(crul)
NEW  <- search()


OLD
NEW

AFTER_load_all  <- search()
AFTER_load_all

cli <- crul::HttpClient$new(url = "https://eu.httpbin.org")
cli

# first		
system.time(
  use_cassette(name = "helloworld", {
    cli$get("get")
  })
)

# second
system.time(
  use_cassette(name = "helloworld", {
    cli$get("get")
  })
)


HttpClient
search()
#  [1] ".GlobalEnv"        "package:crul"      "package:R6"        "devtools_shims"   
#  [5] "package:testing"   "package:tinytest"  "package:vcr"       "package:broom"    
#  [9] "package:nvimcom"   "package:stats"     "package:graphics"  "package:grDevices"
# [13] "package:utils"     "package:datasets"  "package:rmarkdown" "package:xfun"     
# [17] "package:sloop"     "package:lobstr"    "package:rlang"     "package:devtools" 
# [21] "package:usethis"   "package:reprex"    "package:methods"   "Autoloads"        
# [25] "package:base"     

env()

ls()
parent.env(env())


http_interactions
current_cassette()
