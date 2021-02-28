class RecordingsController < ApplicationController

    def create
        recording = Recording.create(session_id: 1, audio_data: rec_params)
        byebug
        url = rails_blob_path(recording, only_path: true)
        render json: {url: url}
    end

    private
    
    def rec_params
        params.require(:recording)
    end
end