class Output < ApplicationRecord
  validates :review, :youtube_url, presence: true
  belongs_to :user
  belongs_to :tweet
end
