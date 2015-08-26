require 'twitter_to_timeline'

class TimelineController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ""
      config.consumer_secret = ""
    end

    my_tweets = client.user_timeline('sadzid_suljic')
    @data = TwitterToTimeline::adapt(my_tweets)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data}
    end
  end
end