class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.paginate(page: params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Notícia introduzida com sucesso!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def article_params
      params.require(:article).permit(:title, :date, :summary, :text, :picture, :active, :featured)
  end
end
