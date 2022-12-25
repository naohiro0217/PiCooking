class CookComment < ApplicationRecord

  belongs_to :customer
  belongs_to :cook

  validates :comment, length:{maximum:20}, presence: true
end
