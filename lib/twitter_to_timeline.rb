class TwitterToTimeline
  def self.adapt(tweets)
    data = Hash.new
    data[:timeline] = Hash.new
    data[:timeline][:headline] = 'Timeline of my Tweets'
    data[:timeline][:type] = 'default'
    data[:timeline][:text] = 'Follow me on twitter @sadzid_suljic'
    data[:timeline][:asset] = Hash.new
    data[:timeline][:asset][:media] = 'https://pbs.twimg.com/profile_images/425408286804803584/96mV_bBa.jpeg'
    data[:timeline][:asset][:credit] = 'Sadzid Suljic'
    data[:timeline][:asset][:caption] = ''
    data[:timeline][:date] = Array.new
    data[:timeline][:era] = Array.new

    tweets.each do |t|
      d = Hash.new
      d[:startDate] = '%s,%s,%s' % [t.created_at.year, t.created_at.month, t.created_at.day]
      d[:endDate] = '%s,%s,%s' % [t.created_at.year, t.created_at.month, t.created_at.day]
      d[:headline] = '@' + (t.retweet? ? t.retweeted_tweet.user.username : t.user.username)
      d[:text] = ''
      d[:asset] = Hash.new
      d[:asset][:media] = t.url.to_s
      d[:asset][:thumbnail] = t.retweet? ? t.retweeted_tweet.user.profile_image_url.to_s : t.user.profile_image_url.to_s
      d[:asset][:credit] = ''
      d[:asset][:caption] = ''
      data[:timeline][:date] << d
    end

    return data
  end
end