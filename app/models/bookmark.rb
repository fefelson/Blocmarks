class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :topic, presence: true
  validates :user, presence: true
  validates :url, presence: true

  def getLike
    Like.where(bookmark: self).last
  end

end
