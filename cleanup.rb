require 'twitter'
require 'yaml'
require 'pry'

class TwitterApi
  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    @a = []
    File.open('book.txt','r') do |f|
      f.each_line do |line|
        if line != "\n"
          @a<<line.strip
        end
      end
    end
  end


  def tweet
    t = @a[rand(@a.length)]
    @client.update(t)
  end
end

ta = TwitterApi.new
ta.tweet
