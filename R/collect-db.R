suppressPackageStartupMessages({
  library(dplyr)
  library(dbplyr)
  library(DBI)
  library(aws.s3)
  library(glue)
  library(rtweet)
})

# database configuration
dw <- config::get("datawarehouse")

# connection
con <- DBI::dbConnect(
  odbc::odbc(), 
  Driver   = dw$driver, 
  Server   = dw$server, 
  Database = dw$database, 
  UID      = dw$uid, 
  PWD      = dw$pwd, 
  Port     = dw$port
)

# currently collected tweets (status IDs)
cur_ids <- tbl(con, "rstats_twitter") %>% 
  distinct(status_id) %>% 
  collect()

# collect new tweets
df_new_tweets <- search_tweets2(
  q = c("rstats"),
  n = 18000,
  include_rts = FALSE, 
  retryonratelimit = TRUE, 
  verbose = FALSE, 
  token = readRDS(".rtweet_token2.rds")
)

# get status IDs that we currently do not have
df_append_to_db <- df_new_tweets %>% 
  filter(!status_id %in% cur_ids$status_id) %>% 
  flatten() %>% 
  select(-query) # for some reason my existing data does have this column? oh well, dont need it

# message for log
cat(glue("[{Sys.Date()}] Collecting {nrow(df_append_to_db)} new tweets...\n\n"))

# append to the database table
dbWriteTable(con, "rstats_twitter", df_append_to_db, append = TRUE)

# disconnect
dbDisconnect(con)

# cronR::cron_add(
#   command = "cd /home/tyler/dev/rstats-tweets && /usr/bin/Rscript 'R/collect-db.R' >> 'R/collect-db.log' 2>&1",
#   frequency = "daily",
#   at = "11PM",
#   id = "rstats tweets",
#   tags = "#rstats, #twitter, #data",
#   description = "Collects twitter data with 'rstats' in text, everyday at 11PM."
# )
