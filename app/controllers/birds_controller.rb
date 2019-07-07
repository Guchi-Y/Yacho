class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end

  def show
    @bird = Bird.find(params[:id])
    @points = @bird.points.includes(:bird)
    gon.points = @bird.points.includes(:bird)
  end
end
