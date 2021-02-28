class RecordingsController < ApplicationController

    def create
        recording = Recording.create(session_id: 1, audio_data: rec_params)
        # url = Rails.application.routes.url_helpers.rails_blob_path(recording.audio_data, only_path: true)
        # url = rails_blob_path(recording.audio_data, only_path: true)
        url = url_for(recording.audio_data)
        render json: {url: url}
    end

    private
    
    def rec_params
        params.require(:recording)
    end
end