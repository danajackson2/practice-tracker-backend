class RecordingsController < ApplicationController

    def create
        temp_id= User.find_by(username:'dummy_user').sessions[0].id
        recording = Recording.create(session_id: temp_id, name: rec_params['name'], audio_data: rec_params['recording'])
        url = url_for(recording.audio_data)
        render json: {url: url, id: recording.id, name: recording.name}
    end

    private
    
    def rec_params
        params.require(:data).permit(:name, :recording)
    end
end