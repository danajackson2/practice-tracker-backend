class Etude < ApplicationRecord
    has_many :sejoins
    has_many :sessions, through: :sejoins
end
