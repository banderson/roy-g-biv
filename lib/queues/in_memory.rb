module Queues
  class InMemory
    MAX_VALUES = 100 # don't run out of memory
    @@queue = []

    def self.enqueue(item)
      return if length >= MAX_VALUES
      @@queue << Marshal.dump(item)
    end

    def self.dequeue()
      return nil if length == 0
      Marshal.load @@queue.shift
    end

    def self.length
      @@queue.length
    end

    def self.empty
      @@queue = []
    end
  end
end
