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

    def update
        user = User.find(update_params['id'])
        user.update(username: update_params['username'], instrument: update_params['instrument'])
        render json: user
    end

    def prac_data
        userSessions = User.find(user_id_params).sessions
        etudes = userSessions.map{|us| us.etudes}.flatten
        pieces = userSessions.map{|us| us.pieces}.flatten
        excerpts = userSessions.map{|us| us.excerpts}.flatten
        render json: {etudes: etudes, pieces: pieces, excerpts: excerpts}
    end

    private

    def user_params
        params.require(:user).permit(:username, :instrument, :password)
    end
    
    def user_id_params
        params.require(:user_id)
    end

    def update_params
        params.require(:user).permit(:username, :instrument, :id)
    end

end