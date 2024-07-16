class CommentsController < ApplicationController
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment was successfully created."
      redirect_to @commentable
    else
      flash.now[:error] = "There was an error creating the Comment."
      redirect_to @commentable
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
    @comment.destroy
    redirect_to @commentable
  end

  private

  def find_commentable
    if params[:project_id]
      Project.find(params[:project_id])
    elsif params[:product_id]
      Product.find(params[:product_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end


