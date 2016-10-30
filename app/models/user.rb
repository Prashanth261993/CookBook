class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path('missing_profile.png')
  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

  has_many :votes
  has_many :cuisines_followed_by_users

  def self.entity_types
    { user:'user', article:'article', cuisine: 'cuisine', bookmark: 'bookmark' }
  end



end
