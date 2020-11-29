#Instructions and code for creating world clouds in R using Twitter data
#Watch the video for deatils
# Install and load the following packages
install.packages("twitteR")
install.packages("RCurl")
install.packages("tm")
install.packages("wordcloud")
require(twitteR)
require(RCurl)
require(tm)
require(wordcloud)

# Create a developer account at apps.twitter.com to create an app and to get the following keys

consumer_key  <- 'Y84vQWJK21Yql3NkwTW2bj2O9'
consumer_secret  <- 'sYvWwHFjKuewJhGOnIZfeKBd7x5JDGY21mur4sclWW3d00dGhL'
access_token  <- '1229883638071930882-d4cJcrtvQSnSE07OvQCZUNCNbW1Ver'
access_secret  <- '19kLRte6H7hr8BK359S7oVqUiiXCOwmBZq04RknMAJP7t'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# Get the tweets from Twitter 
corona_tweets = searchTwitter("Corona","re-open", n=1000, lang="en")
corona_text = sapply(bd_tweets, function(x) x$getText())

# Create a corpus
corona_corpus = Corpus(VectorSource(corona_text))

# Inspect the corpus
inspect(corona_corpus[1])

# Clean the corpus by removing punctuation, numbers, and white spaces
corona_clean  <- tm_map(corona_corpus, removePunctuation)
corona_clean  <- tm_map(corona_clean, removeNumbers)
corona_clean  <- tm_map(corona_clean, stripWhitespace)

# Create Word Cloud from clean data
wordcloud(corona_clean)

# Modify your Word Cloud
wordcloud(corona_clean, random.order = F, max.words = 1000, scale = c(3, 0.5))
