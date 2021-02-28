class Recording < ApplicationRecord
    has_one_attached :audio_data
    belongs_to :session
end
