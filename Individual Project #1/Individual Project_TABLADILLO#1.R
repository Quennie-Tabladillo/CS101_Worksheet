#CS 101 - INDIVIDUAL PROJECT #1
#TABLADILLO, QUENNIE R.
#BSIT 2-A


library('twitteR')
library(tm)
library(dplyr)
library('plotly')
library(ggplot2)
library(RColorBrewer)
library(tidytext)
library(stringr)
library(tidyr)
library(wordcloud)
library(wordcloud2)
library(corpus)

#1. Extract from twitter using your developer's credentials. Choose any keyword you want. 

#Set-up the credentials

CONSUMER_SECRET <- "toX1sXAEkLI3UbNMoqZNO5cHKXHXHDx7FLrdJtTyDYpMxUHURA"
CONSUMER_KEY <- "wIkIRZ1FK5PpQ3VuNbkNptrKo"
ACCESS_SECRET <- "mFh7D99iskoFmAwfmvhzruBS125lvFtRDt8NXdLCdxCl2"
ACCESS_TOKEN <- "1595206734288601089-mNhFu7LvQgkNizQ2ZyeP9Kj0BG7UtN"

#connect to twitter app

setup_twitter_oauth(consumer_key = CONSUMER_KEY,consumer_secret = CONSUMER_SECRET,
                    access_secret = ACCESS_SECRET,access_token = ACCESS_TOKEN)

#2.Get 10000 observations "excluding retweets.

trendTweets <- searchTwitter("tiktok -filter:retweets",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-25",
                             until = "2022-11-26",
                             retryOnRateLimit = 120)
trendTweets

#Convert data into dataframe

trendTweetsDF <- twListToDF(trendTweets)
class(trendTweetsDF)
names(trendTweetsDF)
View(trendTweetsDF)
head(trendTweetsDF)[1:10]
head(trendTweetsDF$text)[1:10]

#save the data into the .Rdata

save(trendTweetsDF,file = "trendingTweetsDF.Rdata")

#Checking for missing values in a data frame

sapply(trendTweetsDF, function(x) sum(is.na(x)))

#Subsetting the data

tweetsDF <- trendTweetsDF %>% select(screenName,text,created,statusSource)
tweetsDF

#saving file as Rdata

save(tweetsDF, file = "tweetsDF.Rdata")

#Grouping the date created

tweetsDF %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

tweetsDF %>% pull(created) %>% min()

tweetsDF %>% pull(created) %>% max()

#3.Plot the time series from the date created. with legends. 

#plotting time series graph using ts_plot() by rtweet package

library(rtweet)

ts_plot(tweetsDF, "hours") +
  labs(x = NULL, y = NULL,
       title = "Frequency of tweets with a #tiktok hashtag",
       subtitle = paste0(format(min(tweetsDF$created), "%d %B %Y"), " to ", 
                         format(max(tweetsDF$created),"%d %B %Y")),
       caption = "Data collected from Twitter's REST API via twitteR") +
  theme_minimal()


#creating histogram

ggplot(data = tweetsDF, aes(x = created), fill = tweetsDF) +
  geom_histogram(aes(fill = ..count..)) + 
  theme(legend.position="right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab("Date") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "darkblue", high = "lightblue")

#4. Plot a graph (any graph you want)  based on the type of device - found in Source
#- that the user use. Include the legends.


#Trend Analysis using the source

encodeSource <- function(x){
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){ 
  }else {
    "others"
  }
}



tweetsDF$tweetSource = sapply(tweetsDF$statusSource,encodeSource)

tweet_appSource <- tweetsDF %>%
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count))

Source_subset <- subset(tweet_appSource,count >10)

#plotting using geom_bar() - bar graph

ggplot(tweetsDF[tweetsDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

dataDF <- data.frame(
  category = tweet_appSource$tweetSource,
  count = tweet_appSource$count
)

dataDF$fraction = dataDF$count / sum(dataDF$count)
dataDF$percentage = dataDF$count / sum(dataDF$count) * 100
dataDF$ymax = cumsum(dataDF$fraction)
dataDF$ymin = c(0, head(dataDF$ymax, n=-1))
dataDF$roundP = round(dataDF$percentage, digits = 2)

#5.Create a wordcloud from the screenName

tweet_appScreen <- tweetsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

#convert to Corpus
namesCorpus <- Corpus(VectorSource(tweetsDF$screenName))  #using ScreenName

wordcloud2(data = tweet_appScreen,
           size = 0.8,
           color = 'random-light',
           shape = 'square')














































