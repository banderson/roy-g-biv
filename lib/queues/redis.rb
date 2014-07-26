module Queues
  class Redis
    REDIS = Redis.new(:url => ENV['REDIS_URL'])
    MAX_VALUES = 1000 # don't run out of memory

    def self.enqueue(item)
      REDIS.lpush 'colors', Marshal.dump(item)
      REDIS.ltrim 'colors', 0, MAX_VALUES-1
    end

    def self.dequeue()
      return nil if length == 0
      Marshal.load REDIS.rpop('colors')
    end

    def self.length
      REDIS.llen 'colors'
    end

    def self.empty
      REDIS.del 'colors'
    end
  end
end
