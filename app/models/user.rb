class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save -> { self.email = email.downcase }, if: -> { email.present? }

  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false },
            presence: true,
            length: { minimum: 3, maximum: 26 }

  validates :email, uniqueness: { case_sensitive: false },
            presence: true,
            length: { minimum: 3 }

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

end
