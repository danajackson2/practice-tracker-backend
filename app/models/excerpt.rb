class Excerpt < ApplicationRecord
    has_many :sxjoins
    has_many :sessions, through: :sxjoins
end
