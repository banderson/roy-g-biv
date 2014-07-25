module Queues
  class InMemory
    @@queue = []

    def self.enqueue(item)
      @@queue << item
    end

    def self.dequeue()
      @@queue.shift
    end

    def self.length
      @@queue.length
    end

    def self.empty
      @@queue = []
    end
  end
end
