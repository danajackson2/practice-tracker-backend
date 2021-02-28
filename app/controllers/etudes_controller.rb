class EtudesController < ApplicationController
    def instEtudes
        byebug
        instrument = User.find(etude_params).instrument
        instPlayers = User.all.select{|u| u.instrument == instrument}
        etudesNestedArray = instPlayers.map do |player| 
            player.sessions.map do |session|
                session.sejoins.map do |sejoin|
                    sejoin.etude
                end
            end       
        end
        byebug
        etudesNestedArray.flatten
    end

    private

    def etude_params
        params.require(:user_id)
    end
end
