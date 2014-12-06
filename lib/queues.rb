module Queues
  extend self

  def instance
    const_get Rails.configuration.queue.to_s.camelize
  end
end
