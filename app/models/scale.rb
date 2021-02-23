class Scale < ApplicationRecord
    has_many :scjoins
    has_many :sessions, through: :scjoins
end
