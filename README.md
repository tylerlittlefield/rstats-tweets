
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

    #> # A tibble: 2,738 x 2
    #>    created_at          text                                                     
    #>    <dttm>              <chr>                                                    
    #>  1 2020-02-10 03:16:14 "Dig into Data Science Day on March 3 by registering for…
    #>  2 2020-02-10 03:07:04 "#SAP Launches End-to-End Chatbot Platform for the Enter…
    #>  3 2020-02-03 20:49:34 "Difference Between #MachineLearning and #DeepLearning @…
    #>  4 2020-02-10 03:02:01 "End to End Machine Learning with Natural Language Proce…
    #>  5 2020-02-06 05:37:03 "SnapLogic Introduces Self-Service Solution for End-to-E…
    #>  6 2020-02-04 06:01:10 "A #Bitcoin Trading Bot Written in #NodeJS. #BigData #An…
    #>  7 2020-02-07 14:29:42 "Tools for the Measurement of Animal Behavior in #Neuros…
    #>  8 2020-02-03 20:37:06 "Automatic Machine Learning @Capgemini. #BigData #Analyt…
    #>  9 2020-02-04 05:47:09 "All Kinds of Text Classification Models Explained. #Big…
    #> 10 2020-02-04 05:42:10 "The Autonomous Learning Library for Building #Reinforce…
    #> # … with 2,728 more rows
