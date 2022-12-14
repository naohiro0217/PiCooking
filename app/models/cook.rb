class Cook < ApplicationRecord

  belongs_to :customer
  has_many :cook_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence:true, length:{maximum:10}
  validates :body, presence:true, length:{maximum:50}
  validates :tag, presence:true, length:{maximum:10}
  validates :image, presence:true
  validates :rate, presence:true

  # レビューの星の数の絞り込み
  scope :search_by_rate, ->(rate) { where(rate: rate.to_i) }

  # 投稿内容の検索
  def self.search_for(content, method)
    if method == 'perfect'
      Cook.where(title: content)
    elsif method == 'forward'
      Cook.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Cook.where('title LIKE ?', '%'+content)
    else
      Cook.where('title LIKE ?', '%'+content+'%')
    end
  end

  # タグ検索
  def self.search_by_tag(content, method)
    if method == 'perfect'
      Cook.where(tag: content)
    end
  end

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fit: [width, height]).processed
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
