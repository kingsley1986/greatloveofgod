class SermonsController < ApplicationController

  def index
    @sermons = Sermon.all.order('created_at DESC').paginate(page: params[:page], per_page:  8)
  end

  def show
    @sermon = Sermon.find(params[:id])
  end
end
