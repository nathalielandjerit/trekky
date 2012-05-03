class CommentsController < ApplicationController
  
  def create
    #@activity = @travel.activities.find(params[:activity_id])
    @activity = @travel.activity.find(params[:id])
    @comment = @activity.comments.new(params[:comment])
    if @comment.save
      flash[:success] = "bravo tru as ecrit un commentaire"
      redirect_to @activity
    else
      render "activity/show"
    end
  end

  def destroy
    #@article = Article.find(params[:article_id])
    #@comment = Comment.find(params[:id])
      #@comment.destroy
      #redirect_to articles_url
  end
end
