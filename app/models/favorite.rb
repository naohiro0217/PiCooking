class Favorite < ApplicationRecord

  belongss_to :customer
  belongss_to :cook

  validates_uniqueness_of :book_id, scope: :user_id

end
