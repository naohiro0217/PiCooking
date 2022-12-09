class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cooks
  has_many :cook_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  # プロフィールは５０字以内
  validates :introduction, presence: true, length: { maximum: 50 }
  validates :email, presence: true

end
