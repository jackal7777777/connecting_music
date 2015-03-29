class Genre < ActiveRecord::Base

  validates :genre_name, presence: true, uniqueness: true

  has_many :community
  has_many :music
end
