
# -------------------------------------------------------
#	Search path:  original, after library, after load_all
# -------------------------------------------------------
OLD  <- search()

library(vcr)
library(crul)
NEW  <- search()


AFTER_load_all  <- search()
AFTER_load_all

# -------------------------------------------------------
#	Configuration
# -------------------------------------------------------
#
vcr_configuration()
# <vcr configuration>
#   Cassette Dir: .
#   Record: once
#   Serialize with: yaml
#   URI Parser: crul::url_parse
#   Match Requests on: method, uri
#   Preserve Bytes?: FALSE
#   Logging?: FALSE
#   ignored hosts: 
#   ignore localhost?: FALSE
#   Write disk path: 
#
vcr_config_defaults()
# $warn_on_empty_cassette
# [1] TRUE
# 
# $quiet
# [1] TRUE
# 
# $verbose_errors
# [1] FALSE
# 
# $write_disk_path
# NULL
# 
# $filter_query_parameters
# NULL
# 
# $filter_response_headers
# NULL
# 
# $filter_request_headers
# NULL
# 
# $filter_sensitive_data_regex
# NULL
# 
# $filter_sensitive_data
# NULL
# 
# $log_opts
# $log_opts$file
# [1] "vcr.log"
# 
# $log_opts$log_prefix
# [1] "Cassette"
# 
# $log_opts$date
# [1] TRUE
# 
# 
# $log
# [1] FALSE
# 
# $linked_context
# NULL
# 
# $cassettes
# list()
# 
# $allow_http_connections_when_no_cassette
# [1] FALSE
# 
# $clean_outdated_http_interactions
# [1] FALSE
# 
# $re_record_interval
# NULL
# 
# $turned_off
# [1] FALSE
# 
# $preserve_exact_body_bytes
# [1] FALSE
# 
# $uri_parser
# [1] "crul::url_parse"
# 
# $ignore_request
# NULL
# 
# $ignore_localhost
# [1] FALSE
# 
# $ignore_hosts
# NULL
# 
# $persist_with
# [1] "FileSystem"
# 
# $json_pretty
# [1] FALSE
# 
# $serialize_with
# [1] "yaml"
# 
# $allow_unused_http_interactions
# [1] TRUE
# 
# $match_requests_on
# [1] "method" "uri"   
# 
# $record
# [1] "once"
# 
# $dir
# [1] "."
#
#
vcr_configure_reset()

crul_settings() 
# mock :  logi FALSE
