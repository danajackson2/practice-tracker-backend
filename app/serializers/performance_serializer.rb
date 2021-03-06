class PerformanceSerializer < ActiveModel::Serializer
  attributes :id, :date, :composer, :piece, :event
  has_one :user
end
