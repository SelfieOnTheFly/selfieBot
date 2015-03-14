namespace :bot do

  desc 'Blaaaaaa ablablab'
  task :fetch_followers => :environment do
    twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    begin
      followers = twitter.followers
      followers_ids = followers.map { |follower| follower.id.to_s}
      known_ids = User.where('tw_id IN (?)', followers_ids).map { |user| user.tw_id.to_s}
      new_ids  = followers_ids - known_ids

      new_ids.each do |id|
        twitter_user = (followers.to_h[:users].select { |user| user[:id] == id }).first

        created_user = User.create(:tw_id => twitter_user[:id_str], :tw_handle => twitter_user[:screen_name])
        puts "Created #{created_user.tw_id} "
      end

      puts "Now in base : #{User.count}"
    rescue Twitter::Error::TooManyRequests
      puts 'Rate limit exceeded'
    end
  end
end