class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark

  validates :user, presence: true
  validates :bookmark, presence: true

  default_scope { order('created_at DESC') }

end
