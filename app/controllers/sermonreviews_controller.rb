class SermonreviewsController < ApplicationController

  def new
    @sermon_comments = Sermonreview.new
  end

  def create
    @sermon = Sermon.find(params[:sermon_id])
    @sermoncomment = @sermon.sermonreviews.create(sermon_comments_params)
      if verify_recaptcha(model: @sermoncomment) && @sermoncomment.save
      flash[:notice] = "Your comment has been posted, we will review and approve it soon"
      redirect_to :back
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
