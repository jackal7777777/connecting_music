class Community < ActiveRecord::Base

  validates :genre_id, presence: true
  validates :community_name, presence: true, uniqueuness: true

end
