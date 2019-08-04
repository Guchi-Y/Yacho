class BirdsController < ApplicationController
  def index
    @birds = Bird.all.order_bird_name
  end

  def show
    @bird = Bird.find(params[:id])
    gon.points = @bird.points.includes(:bird)
  end

  def search
    @birds = get_search_birds.zip(get_search_birds_points)

    respond_to do |format|
      format.json { render 'index', json: @birds }
    end
  end

  private

  def not_input_decision
    params[:birds_name].length == 0 ? "" : "%#{params[:birds_name]}%"
  end

  def get_search_birds
    birds = Bird.where('name LIKE(?)', not_input_decision).order_bird_name
  end

  def get_search_birds_points
    bird_points_count = []
    get_search_birds.each do |bird|
      bird_points_count << bird.points.includes(:bird).count
    end
    return bird_points_count
  end
end
