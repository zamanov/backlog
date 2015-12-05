class Story < ActiveRecord::Base
  validates :name, presence: true
  validates :points, :rank, numericality: { greater_than: 0 }
end
