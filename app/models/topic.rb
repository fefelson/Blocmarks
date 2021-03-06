class Topic < ActiveRecord::Base

  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, length: { minimum: 3 }

end
