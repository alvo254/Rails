class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])
  end

  # Creating a new Article "C in crud"
  # In a Rails application, these steps are conventionally handled by a 
  # controller's new and create actions. Let's add a typical implementation 
  # of these actions to
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: "...", body: "...")
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

end
