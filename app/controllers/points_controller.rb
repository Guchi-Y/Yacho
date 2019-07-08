class PointsController < ApplicationController
  def create
    @bird_id = point_params[:bird_id]
    redirect_to controller: :birds, action: :show, id: @bird_id unless (Point.create(point_params)).save
  end

  private
  def point_params
    params.require(:point).permit(:bird_id, :latitude, :longitube).merge(user_id: current_user.id)
  end
end
