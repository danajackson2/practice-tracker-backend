class PerformancesController < ApplicationController

    def create
        perf = Performance.create(perf_params)
        userPerformances = Performance.select{|perf| perf.user_id == perf_params[:user_id]}
        render json: userPerformances
    end

    def index

    end

    private
    def perf_params
        params.require(:performance).permit(:user_id, :date, :composer, :piece, :event)
    end
end
