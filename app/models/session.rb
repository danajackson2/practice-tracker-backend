class Session < ApplicationRecord
  belongs_to :user
  has_many :recordings, dependent: :destroy
  has_many :scjoins, dependent: :destroy
  has_many :scales, through: :scjoins
  has_many :sljoins, dependent: :destroy
  has_many :longtones, through: :sljoins
  has_many :spjoins, dependent: :destroy
  has_many :pieces, through: :spjoins
  has_many :sxjoins, dependent: :destroy
  has_many :excerpts, through: :sxjoins
  has_many :sejoins, dependent: :destroy
  has_many :etudes, through: :sejoins
end