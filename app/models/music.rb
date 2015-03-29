class Music < ActiveRecord::Base

  validates :genre_id, presence: true
  validates :user_id, presence: true
  validates :song_title, presence: true, uniqueness: true
  #validates :music_file_path, presence: true, uniqueness: true

  belongs_to :genre
  belongs_to :user
  has_many :comment
end