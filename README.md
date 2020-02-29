
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rstats-tweets

<!-- badges: start -->

<!-- badges: end -->

This repository collects twitter data and stores it to my own personal
s3 bucket. More specifically, it…

  - Uses `rtweet` to search for tweets with *rstats* in the text.
  - Compares new tweets to tweets that I have already collected by
    filtering out status IDs that already exist.
  - Saves the dataset to a personal s3 bucket.
  - Does this daily using a cron job from `cronR`.

I have no real use case for this at the moment. I am more or less just
interested in setting up a job to collect data. I think of it as a kind
of template that I may come back to if there is any twitter data I’d
like to routinely collect.

    #> # A tibble: 10,606 x 2
    #>    created_at          text                                                     
    #>    <dttm>              <chr>                                                    
    #>  1 2020-02-29 23:13:15 "IAM Platform Curated Retweet:\n\nVia: https://t.co/qx1b…
    #>  2 2020-02-29 23:10:45 "{poorman} now has inner, left, right and full joins. Mo…
    #>  3 2020-02-29 23:07:17 "Weighted Linear Support Vector Machine https://t.co/aR5…
    #>  4 2020-02-28 20:04:05 "By inspiration from @aecoppock, I made a quick R packag…
    #>  5 2020-02-27 16:09:00 "Take a Sad Script &amp; Make it Better: Tidymodels Edit…
    #>  6 2020-02-27 22:30:44 "My latest blog post is in the spirit of working efficie…
    #>  7 2020-02-24 21:26:38 "I like the tufte Rmarkdown theme for its sidenotes func…
    #>  8 2020-02-24 17:39:25 "My new {usa} #rstats 📦 was just released on CRAN! As a …
    #>  9 2020-02-22 22:53:37 "#r #rstats #RStudio https://t.co/inuu5231r5"            
    #> 10 2020-02-21 20:28:30 "$APT \n\n$TVIX &lt;\n\n#DeepLearning #BigData #Analytic…
    #> # … with 10,596 more rows
