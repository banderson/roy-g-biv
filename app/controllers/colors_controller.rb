class ColorsController < ApplicationController
  def create
    Color.enqueue
    head :created
  end

  # shouldn't be destructive, I know...
  def show
    render json: Color.dequeue || Color.new
  end
end
