class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create #login/signup
        user = User.find_by(username: params[:username])
        
        userSessions = user.sessions.map{|sesh| {id: sesh.id, date:sesh.date, duration:sesh.duration, focus_rating: sesh.focus_rating, prod_rating: sesh.prod_rating, notes: sesh.notes, etudes:sesh.etudes, pieces:sesh.pieces, excerpts:sesh.excerpts, longtones:sesh.longtones, scales:sesh.scales}}
        
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {username: user.username, user_id: user.id, instrument: user.instrument, userSessions: userSessions, token: token}
        else
            render json: {error: 'User could not be found'}, status: 401
        end
    end

    def show #persist
        userSessions = @user.sessions.map{|sesh| {id: sesh.id, date:sesh.date, duration:sesh.duration, focus_rating: sesh.focus_rating, prod_rating: sesh.prod_rating, notes: sesh.notes, etudes:sesh.etudes, pieces:sesh.pieces, excerpts:sesh.excerpts, longtones:sesh.longtones, scales:sesh.scales}}
        
        render json: {username: @user.username, user_id: @user.id, instrument: @user.instrument, userSessions: userSessions}
    end

end
