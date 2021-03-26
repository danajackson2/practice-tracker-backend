class RecordingsController < ApplicationController

    def create
        temp_id = Session.find_or_create_by(duration:'dummy', user_id:rec_params['userId']).id
        recording = Recording.create(session_id: temp_id, name: rec_params['name'], audio_data: rec_params['recording'])
        url = url_for(recording.audio_data)
        render json: {url: url, id: recording.id, name: recording.name}
    end

    def show
        getRecordings = Session.find(get_rec_params['id']).recordings
        recordings = getRecordings.map{|rec| {url: url_for(rec.audio_data), id: rec.id, name: rec.name}}
        render json: {recordings: recordings}
    end

    def destroy
        rec = Recording.find(params[:id])
        rec.destroy
        render json: {message: "Recording #{params[:id]} Deleted"}
    end

    private
    
    def rec_params
        params.require(:data).permit(:name, :recording, :userId)
    end

    def get_rec_params
        params.permit(:id)
    end
end