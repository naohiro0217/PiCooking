class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cooks, dependent: :destroy
  has_many :cook_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :introduction, length: { maximum: 50 }
  validates :email, presence: true

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # 会員検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Customer.where(nickname: content)
    elsif method == 'forward'
      Customer.where('nickname LIKE ?', content + '%')
    elsif method == 'backward'
      Customer.where('nickname LIKE ?', '%' + content)
    else
      Customer.where('nickname LIKE ?', '%' + content + '%')
    end
  end

  # 退会機能
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestuser"
      customer.nickname = "ゲスト"
    end
  end

end
