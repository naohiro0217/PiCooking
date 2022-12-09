class CookComment < ApplicationRecord

  belongss_to :customer
  belongss_to :cook

  validates :comment, presence: true
end
