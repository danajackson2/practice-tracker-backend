class Longtone < ApplicationRecord
    has_many :sljoins
    has_many :sessions, through: :sljoins
end
