module PostsHelper

  def current_user_signed_in
    current_user && user_signed_in?
  end
end
