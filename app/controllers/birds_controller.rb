class BirdsController < ApplicationController
  def index
    @birds = Bird.all.order("name ASC")
  end

  def show
    @bird = Bird.find(params[:id])
    gon.points = @bird.points.includes(:bird)
  end

  def search
    @birds = Bird.where('name LIKE(?)', not_input_decision)
    respond_to do |format|
      format.json { render 'index', json: @birds }
    end
  end

  private

  def not_input_decision
    params[:birds_name].length == 0 ? "" : "%#{params[:birds_name]}%"
  end
end
