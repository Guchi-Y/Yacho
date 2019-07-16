class BirdsController < ApplicationController
  def index
    @birds = Bird.all.order("name ASC")
  end

  def show
    @bird = Bird.find(params[:id])
    gon.points = @bird.points.includes(:bird)
  end

  def search
  end
end
