class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def create
    params_to_store = article_params[:article].slice(:title, :content, :cuisine_id)
    @article = Article.new(params_to_store)
    @article.author_id = current_user.id
    if @article.save
      redirect_to articles_path, notice: "The question has been successfully created."
    else
      render action: "new"
    end
  end

  def index
    @articles = Article.where(author_id: current_user.id).order("created_at DESC")
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :cuisine_id, :ingredients)
  end
end