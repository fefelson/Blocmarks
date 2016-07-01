class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :fans, through: :likes, source: :user

  validates :topic, presence: true
  validates :user, presence: true
  validates :url, presence: true
end
