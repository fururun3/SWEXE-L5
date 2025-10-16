class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :like_tweets, through: :likes, source: :tweet
    validates :message, presence: true
end
