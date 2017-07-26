class PostsController < ApplicationController
  before_action :find_post_id, except: [:index, :like, :new, :create]

  def index
    @posts = Post.order('created_at DESC').paginate(page: params[:page], per_page:  5)
    # respond_to do |format|
    #   format.json { render :json =>  @posts}
    # end
  end

  def show
  end

  def like
    @post = Post.find(params[:id])
    @post.update_attributes(like: true)
    @post.liker_id += [current_user.id]
    respond_to do |format |
      if @post.save
        format.json { render json: @post }
      end
    end
  end


  def unlike
    @post = Post.find(params[:id])
    @post.update_attributes(like: false)
    @post.liker_id -= [current_user.id]
    respond_to do |format |
      if @post.save
        format.json { render json: @post }
      end
    end
  end

  def new
    if pastor
      @post = Post.new
    else
      redirect_to :back
    end
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if pastor
      authorize @post
      @post.save
        redirect_to posts_path
    else
        render :new
    end
  end


  def edit
    if pastor
    end
  end

  def update
    if pastor
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render new
      end
    end
  end

  def find_post_id
    @post  = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :post_body, :like, :liker_id, pictures_attributes: [:id, :post_id, :image])
  end
end
