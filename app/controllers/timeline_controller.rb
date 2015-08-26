require 'twitter_to_timeline'

class TimelineController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = "42okgrA6b3EeGZls8VcWygfVi"
      config.consumer_secret = "c3Cmb9phQa54SzSoNFme6WqTEEr2f59UrOk1nWB3pKaQeN62Nf"
    end

    my_tweets = client.user_timeline('sadzid_suljic')
    @data = TwitterToTimeline::adapt(my_tweets)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data}
    end
  end
end