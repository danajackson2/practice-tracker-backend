class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create #login/signup
        user = User.find_by(username: params[:username])
        
        if user && user.authenticate(params[:password])
            userSessions = user.sessions.map{|sesh| {id: sesh.id, date:sesh.date, duration:sesh.duration, focus_rating: sesh.focus_rating, prod_rating: sesh.prod_rating, notes: sesh.notes, etudes:sesh.etudes, pieces:sesh.pieces, excerpts:sesh.excerpts, longtones:sesh.longtones, scales:sesh.scales}}
            token = encode_token({user_id: user.id})

            userPerformances = user.performances.map{|p| {id: p.id, date: p.date, composer: p.composer, piece: p.piece, event: p.event}}

            render json: {username: user.username, user_id: user.id, instrument: user.instrument, userSessions: userSessions, userPerformances: userPerformances, token: token}
        else
            render json: {error: 'User could not be found'}, status: 401
        end
    end

    def show #persist
        userSessions = @user.sessions.map{|sesh| {id: sesh.id, date:sesh.date, duration:sesh.duration, focus_rating: sesh.focus_rating, prod_rating: sesh.prod_rating, notes: sesh.notes, etudes:sesh.etudes, pieces:sesh.pieces, excerpts:sesh.excerpts, longtones:sesh.longtones, scales:sesh.scales}}
        
        userPerformances = @user.performances.map{|p| {id: p.id, date: p.date, composer: p.composer, piece: p.piece, event: p.event}}
        
        render json: {username: @user.username, user_id: @user.id, instrument: @user.instrument, userSessions: userSessions, userPerformances: userPerformances}
    end

end
