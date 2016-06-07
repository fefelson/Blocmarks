class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save -> { self.email = email.downcase }, if: -> { email.present? }

  has_many :topics

  validates :name, uniqueness: { case_sensitive: false },
            presence: true,
            length: { minimum: 4, maximum: 26 }

  validates :email, uniqueness: { case_sensitive: false },
            presence: true,
            length: { minimum: 3 }


end
