class RecordingsController < ApplicationController

    def create
        temp_id= User.find_by(username:'dummy_user').sessions[0].id
        recording = Recording.create(session_id: temp_id, audio_data: rec_params)
        # add title to recording
        url = url_for(recording.audio_data)
        render json: {url: url, id: recording.id}
    end

    private
    
    def rec_params
        params.require(:recording)
    end
end