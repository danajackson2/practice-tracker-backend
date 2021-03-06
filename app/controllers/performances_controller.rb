class PerformancesController < ApplicationController

    def create
        perf = Performance.create(perf_params)
        render json: {msg: 'Performance Created!'}
    end

    def index

    end

    private
    def perf_params
        params.require(:performance).permit(:user_id, :date, :composer, :piece, :event)
    end
end
