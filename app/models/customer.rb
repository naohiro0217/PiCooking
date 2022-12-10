class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cooks, dependent: :destroy
  has_many :cook_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  # プロフィールは５０字以内
  validates :introduction, length: { maximum: 50 }
  validates :email, presence: true
  
  has_one_attached :profile_image
  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end

end
