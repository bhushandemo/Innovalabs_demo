class BlogsController < ApplicationController
  before_action :require_login

  def index
    @blogs = current_user.blogs # Assuming you have a Blog model
  end

  private

  def require_login
    unless current_user
      redirect_to login_path, alert: 'You must be logged in to access this page.'
    end
  end
end
