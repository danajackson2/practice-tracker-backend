class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {username: user.username, user_id: user.id, instrument: user.instrument, token: token}
        else
            render json: {error: 'User could not be found'}, status: 401
        end
    end

    def show
        render json: {username: @user.username, user_id: @user.id, instrument: @user.instrument}
    end

end
