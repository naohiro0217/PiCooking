class Cook < ApplicationRecord

  belongs_to :customer
  has_many :cook_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :cook_tags, dependent: :destroy
  has_many :tags, through: :cook_tags

  validates :title, presence:true
  # 感想は２００字以内
  validates :body, presence:true, length:{maximum:200}

  def save_tags(savecook_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savecook_tags
    new_tags = savecook_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      cook_tag = Tag.find_or_create_by(name:new_name)
      self.tags << cook_tag
    end
  end

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
