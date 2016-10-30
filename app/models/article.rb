class Article < ApplicationRecord
  belongs_to :cuisine

  attr_accessor :ingredients

  def user
    User.find(self.author_id)
  end

end
