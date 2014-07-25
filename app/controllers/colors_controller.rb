class ColorsController < ApplicationController
  def create
    Queues::InMemory.enqueue Color.get_random
    head :created
  end

  # shouldn't be destructive, I know...
  def show
    render json: Queues::InMemory.dequeue || Color.new
  end
end
