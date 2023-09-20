module Api
  class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        jwt_token = generate_jwt(user)
        render json: { message: 'Login successful', user_id: user.id, token: jwt_token }
      else
        render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
      end
    end

    private

    def generate_jwt(user)
      payload = { user_id: user.id }
      JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end
  end
end
