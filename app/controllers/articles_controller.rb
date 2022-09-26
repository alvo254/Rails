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
    @article = Article.new(artice_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # The edit action fetches the article from the database, and stores it in @article 
  # so that it can be used when building the form. By default, 
  # the edit action will render

  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])

    if @article.update(artice_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Deleting and article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end


  private
  def artice_params
    params.require(:articles).permit(:title, :body)
  end

end
