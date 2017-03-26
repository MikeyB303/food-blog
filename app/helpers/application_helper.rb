module ApplicationHelper

  def author?(blog)
    return current_user.id == blog.user_id
  end
end
