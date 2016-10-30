class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = @user || current_user
    following_users_id = @user.votes.where(entity_type: User.entity_types[:user])
    @feed_articles_by_user = Article.where(author_id: following_users_id)

    cuisine_ids_followed_by_user = CuisinesFollowedByUser.where(user_id: @user.id).pluck(:cuisine_id)
    @feed_articles_by_cuisines = Article.where(cuisine_id: cuisine_ids_followed_by_user)

    @response_hash = {user: @feed_articles_by_user, cuisine: @feed_articles_by_cuisines}
  end

  def edit
    @user = @user || current_user
  end

  def update_profile
    source_params = params[:user].permit(:name, :country, :profile_picture)
    @user  = User.find(current_user.id)
    @user.name = source_params[:name]
    @user.country = source_params[:country]
    @user.profile_picture = source_params[:profile_picture]
    if @user.save
      redirect_to edit_user_path(@user.id), notice: "Your profile has been successfully updated."
    else
      redirect_to edit_user_path(@user.id), notice: "Something went wrong"
    end
  end
end