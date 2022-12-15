class Cook < ApplicationRecord

  belongs_to :customer
  has_many :cook_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :title, presence:true
  # 感想は２００字以内
  validates :body, presence:true, length:{maximum:200}


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

  def self.search_cooks_for(content, method)
    if method == 'perfect'
      Cook.where(name: content)
    elsif method == 'forward'
      Cook.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Cook.where('name LIKE ?', '%' + content)
    else
      Cook.where('name LIKE ?', '%' + content + '%')
    end
  end

  def self.search_cooks_for(content, method)
    if method == 'rate.count: 5'
      Cook.where('count: 5')
    elsif method == 'rate.count: 4'
      Cook.where('count: 4')
    elsif method == 'rate.count: 3'
      Cook.where('count: 3')
    elsif method == 'rate.count: 2'
      Cook.where('count: 2')
    else
      Cook.where('count: 1')
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
