class SessionsController < ApplicationController

    def create
        session = Session.create(
            user_id: session_params['user_id'], 
            date: session_params['date'], 
            duration: session_params['duration'], 
            prod_rating: session_params['prod_rating'], 
            focus_rating: session_params['focus_rating'], 
            notes:session_params['notes']
        )
        session_params['longtones'].each{|lt| Sljoin.create(session_id: session.id, longtone_id: Longtone.find_by(note: lt).id)}
        session_params['scales'].each{|scale| Scjoin.create(session_id: session.id, scale_id: Scale.find_by(note: scale.split(' ')[0], quality: scale.split(' ')[1]).id)}
        session_params['etudes'].each{|etude| Sejoin.create(session_id: session.id, etude_id: Etude.find_or_create_by(composer: etude['composer'], book: etude['book'], number: etude['number']).id)}
        session_params['pieces'].each{|piece| Spjoin.create(session_id: session.id, piece_id: Piece.find_or_create_by(composer: piece['composer'], title: piece['title']).id)}
        session_params['excerpts'].each{|ex| Sxjoin.create(session_id: session.id, excerpt_id: Excerpt.find_or_create_by(composer: ex['composer'], work: ex['work'], place: ex['place']).id)}
        
        temp_id = User.find_by(username:'dummy_user').sessions[0].id
        newRecs = Recording.all.select{|rec| rec.session_id == temp_id}
        newRecs.each{|rec| rec.update(session_id: session.id)}
        render json: {message: 'Great practice, now go take a break!'}
    end

    private

    def session_params 
        params.require(:session).permit(
            :user_id,
            :date,
            :duration,
            :notes, 
            :prod_rating, 
            :focus_rating, 
            longtones: [], 
            scales: [],
            etudes: [
                :composer,
                :book,
                :number
            ], 
            pieces: [
                :composer,
                :title
            ], 
            excerpts: [
                :composer,
                :work,
                :place
            ],
        )
    end

end