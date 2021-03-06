class ArticlesController < ApplicationController
  before_filter :require_login, except: [:show, :index]

  def index 
    @articles = Article.all   
  end 

  def show 
    article
    @comment = Comment.new
    @comment.article_id = article.id
  end 

  def new 
    @article = current_user.articles.build
  end 

  def create 
    @article = current_user.articles.create(article_params)
    flash.notice = "Article '#{@article.title}' was created!"
    redirect_to article_path(@article)
  end 

  def destroy 
    article.destroy
    flash.notice = "Article '#{@article.title}' was destroyed!"
    redirect_to articles_path
  end 

  def edit 
    article
  end 

  def update 
    article.update(article_params)
    flash.notice = "Article '#{article.title}' is updated!"
    redirect_to article_path(article)
  end 

  private 

  def article_params 
    params.require(:article).permit(:title, :body, :tag_list)
  end 

  def article 
    @article ||= Article.find(params[:id])
  end 
end