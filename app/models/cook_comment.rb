class CookComment < ApplicationRecord

  belongs_to :customer
  belongs_to :cook

  # validates :comment, presence: true
end
