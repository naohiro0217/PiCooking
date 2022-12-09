class Cook < ApplicationRecord
  
  belongss_to :customer
  
  has_many :cook_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
end
