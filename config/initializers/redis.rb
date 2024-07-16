# config/initializers/redis.rb
$redis = Redis.new(url: ENV["REDIS_URL"])
