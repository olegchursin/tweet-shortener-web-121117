def dictionary
  dictionary = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
    tweet_ary = tweet.split # create an array from the string
    new_array = tweet_ary.map do |w|  # iterating over each element of the tweet array and creating a new array with .map method
      if dictionary.keys.include?(w.downcase) # comparing keys from dictionary array to each element in the tweet_ary
        w = dictionary[w.downcase] # substitute the word if a match occurs
      else
        w # leave a word as is if no match occurs
      end
    end
    new_array.join(" ") # convert array back to string
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
    if tweet.length > 140
      word_substituter(tweet)
    else
      tweet
    end
end

def shortened_tweet_truncator(tweet)
  if word_substituter(tweet).length > 140
    word_substituter(tweet)[0..136] << "..."
  else
    tweet
  end
end
