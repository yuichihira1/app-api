class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :scores
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!

  validates :access_token, uniqueness: true, allow_nil: true
  validates :email, presence: true

#   ユーザーidとDeviseのトークンを組み合わせてアクセストークンを生成
  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end

end
