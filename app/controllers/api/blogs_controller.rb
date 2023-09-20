module Api
  class BlogsController < ApplicationController
    before_action :authenticate_user

    def index
      @blogs = @current_user.blogs
      render json: @blogs
    end

    private

    def authenticate_user
      token = request.headers['Authorization']&.split(' ')&.last
      unless token && valid_token?(token)
        render json: { error: 'Authentication required' }, status: :unauthorized
      end
    end


    def valid_token?(token)
      begin
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
        user_id = decoded_token.first['user_id']
        @current_user = User.find_by(id: user_id)
        @current_user.present?
      rescue JWT::DecodeError
        false
      end
    end
  end
end
