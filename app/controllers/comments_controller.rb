class CommentsController < ApplicationController
  
  def create
    @activity = Activity.find(params[:activity_id])
    
    if current_user
      params[:comment][:user_id] = current_user.id
    else
      params[:comment][:user_id] = 0
    end
    @comment = @activity.comments.new(params[:comment])
    if @comment.save
      flash[:success] = "Votre commentaire à bien été enregistrer"
      redirect_to [@activity.travel, @activity]
    else
      render "activities/show"
    end
  end

  def destroy
    #@article = Article.find(params[:article_id])
    #@comment = Comment.find(params[:id])
      #@comment.destroy
      #redirect_to articles_url
  end
end
