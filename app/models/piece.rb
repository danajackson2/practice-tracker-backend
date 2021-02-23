class Piece < ApplicationRecord
    has_many :spjoins
    has_many :sessions, through: :spjoins
end
