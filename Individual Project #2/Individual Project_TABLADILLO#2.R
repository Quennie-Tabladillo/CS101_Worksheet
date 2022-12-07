#INDIVIDUAL PROJECT 2
#TABLADILLO,QUENNIE 
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

#1.Extract 10000 tweets from Twitter using twitteR package including retweets.
CONSUMER_SECRET <- "bLPjzosz93WveYTTs5WkH4s08ZPLBp24jrfiKWJJWoJgPSXLrk"
CONSUMER_KEY <- "O8FmllWzac0F9uViLiZLAEKQG"
ACCESS_SECRET <- "arKHRE4k0Nr10Nz6CZXIl335Wv5otPHT0ELTxCRPzu5uM"
ACCESS_TOKEN <- "1595206734288601089-kcYhbzJjbnA5nSZmlEgqVDbFbajQdb"

setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

trendTweets <- searchTwitter("#tiktok",
                             n = 10000,
                             lang = "en",
                             since = "2022-11-20",
                             until = "2022-11-30",
                             retryOnRateLimit=120)
trendTweets

trendTweetsDF <- twListToDF(trendTweets)
class(trendTweetsDF)
names(trendTweetsDF)
View(trendTweetsDF)
head(trendTweetsDF)[1:10]
head(trendTweetsDF$text)[1:10]

save(trendTweetsDF,file = "trndtweetsDF.Rdata")
sapply(trendTweetsDF, function(x) sum(is.na(x)))


#2.Subset the retweets and the original tweets into a separate file
originaltweet <- trendTweetsDF %>% select(screenName,text,created,statusSource,
                                  isRetweet) %>% filter(isRetweet == "FALSE")

save(originaltweet, file = "originaltweet.Rdata")

originaltweet %>% group_by(1) %>% summarise(max = max(created), min = min(created))

originaltwt <- originaltweet %>% mutate(Created_At_Round = created %>%
                                          round(units = 'hours') %>% as.POSIXct())
originaltwt

min <- originaltweet %>% pull(created) %>% min()
min

max <- originaltweet %>% pull(created) %>% max()
max


retweets <- trendTweetsDF %>% select(screenName,text,created,statusSource,
                                     isRetweet) %>% filter(isRetweet == 'TRUE')

save(retweets, file = "retweets.Rdata")

retweets %>% group_by() %>% summarise(max = max(created), min = min(created))

retweet <- retweets %>% mutate(Created_At_Round = created %>% 
                                 round(units = 'hours') %>% as.POSIXct())
retweet

min01 <- retweets %>% pull(created) %>% min()
min01

max01 <- retweets %>% pull(created) %>% max()
max01


#3.Plot the retweets and the original tweets using bar graph in vertical manner.

#Including legends

#Original Tweets

originaltweet <- ggplot(originaltwt, aes(x = Created_At_Round)) + 
  geom_histogram(aes(fill = ..count..)) + 
  theme(legend.position = "right") + 
  xlab("Time") + ylab("Number of Original Tweets") + 
  scale_fill_gradient(low = "darkblue", high = "lightblue")

originaltweet %>% ggplotly()

#Retweets 

retweets <- ggplot(retweet, aes(x = Created_At_Round)) + 
  geom_histogram(aes(fill = ..count..)) + 
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of Retweets") +
  scale_fill_gradient(low = "navyblue", high = "lightblue")

retweets %>% ggplotly()



