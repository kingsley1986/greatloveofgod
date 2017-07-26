module CommentsHelper

  def current_user_signed_in
    current_user && user_signed_in?
  end

  def approved_comments
     @post.comments.select { |a| a.approved == ["approved"] } 
  end
end
