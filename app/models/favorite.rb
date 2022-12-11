class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :cook

  validates_uniqueness_of :book_id, scope: :user_id

end
