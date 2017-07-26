module SermonsHelper

  def set_sermons
     Sermon.all.order('created_at DESC').paginate(page: params[:page], per_page:  2)
  end
end
