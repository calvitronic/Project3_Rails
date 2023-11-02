class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.create(article_params)

    if @article.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @user_id = @article.user_id
    @article.destroy

    redirect_to user_path(@user_id), status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
