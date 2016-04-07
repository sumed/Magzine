class ArticlesController < ApplicationController
 before_action :logged_in_user

def logged_in_user
      unless logged_in?
        redirect_to sessions_new_path
      end
end

def new

	@user = User.find(params[:user_id])
	@article = Article.new
end

def show
  if params[:user_id] == nil
    @user = @current_user
  else
      @user = User.find(params[:user_id])
  end
      @article = Article.find(params[:id])
end

def index
	@articles = Article.all
	@user = @current_user
end

def create
  @user = User.find(params[:user_id])
  @article = @user.articles.create(article_params)
  redirect_to user_path(@user)
end


private
    def article_params
      params.require(:article).permit(:title, :author, :text)
    end

end
