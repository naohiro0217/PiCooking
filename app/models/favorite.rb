class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :cook

  validates_uniqueness_of :cook_id, scope: :customer_id

end
