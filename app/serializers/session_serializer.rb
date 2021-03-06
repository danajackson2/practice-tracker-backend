class SessionSerializer < ActiveModel::Serializer
  attributes :id, :date, :duration, :focus_rating, :prod_rating, :notes, :etudes, :pieces, :excerpts, :longtones, :scales
  has_one :user
end
