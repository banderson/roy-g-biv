class ColorsController < ApplicationController
  def create
    Queues::RedisQueue.enqueue Color.get_random
    head :created
  end

  # shouldn't be destructive, I know...
  def show
    render json: Queues::RedisQueue.dequeue || Color.new
  end
end
