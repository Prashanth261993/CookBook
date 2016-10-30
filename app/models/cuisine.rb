class Cuisine < ApplicationRecord
  has_many :articles
  has_many :cuisines_followed_by_users

end
