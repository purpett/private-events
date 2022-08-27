class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :creator_id       
  validates :username, presence: true, uniqueness: true, length: { in: 6..15, too_short: "too short. Minimum %{count} characters", too_long: "too long. Maximum %{count} characters allowed" }
end
