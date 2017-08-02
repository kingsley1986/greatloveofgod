class SermonreviewsController < ApplicationController

  def new
    @sermon_comments = Sermonreview.new
  end

  def create
    @sermon = Sermon.find(params[:sermon_id])
    @sermoncomment = @sermon.sermonreviews.create(sermon_comments_params)
    if @sermoncomment.save
      respond_to do |format|
        format.html { redirect_to   @sermoncomment }
        format.js
      end
    else
      flash[:error] = @sermoncomment.errors.full_messages
      redirect_to @sermon
    end
  end

  def index
    @sermon_comments =  Sermonreview.all
  end

  def show
    @sermon_comment =  Sermonreview.find(params[:id])
  end


  private

  def sermon_comments_params
    params.require(:sermonreview).permit(:body, :name, :email)
  end
end
