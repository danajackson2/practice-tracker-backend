class Session < ApplicationRecord
  belongs_to :user
  has_many :recordings
  has_many :scjoins
  has_many :scales, through: :scjoins
  has_many :sljoins
  has_many :longtones, through: :sljoins
  has_many :spjoins
  has_many :pieces, through: :spjoins
  has_many :sxjoins
  has_many :excerpts, through: :sxjoins
  has_many :sejoins
  has_many :etudes, through: :sejoins
end
