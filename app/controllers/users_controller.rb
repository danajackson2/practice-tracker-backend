class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token({user_id: user.id})
            render json: {username: user.username, user_id: user.id, instrument: user.instrument, token: token}
        else
            render json: {error: 'Failed to create user'}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :instrument, :password)
    end
end
