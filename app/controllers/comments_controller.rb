class CommentsController < ApplicationController
def create	
	if params[:user_id]
	@user = User.find(params[:user_id]).id
    else
    	@user = session[:user_id]
    end

	@article = Article.find(params[:article_id])
	@comment = @article.comments.build(comment_params)
	@comment.user_id = @user
    @comment.save
	redirect_to user_article_path(@user, @article)

    end


def destroy
	@user = User.find(params[:user_id])
	@article = Article.find(params[:article_id])
	@comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_article_path(@user,@article)
end

 private
    def comment_params
      params.require(:comment).permit(:commenting, :body)
end
end
