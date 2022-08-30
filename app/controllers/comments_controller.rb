class CommentsController < ApplicationController
  http_basic_authenticate_with name: "fortune", password:"123456", only: [:destroy]



  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
   
    # redirect_to post_path(@post)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # def show
  #   @post = Post.find(params[:post_id])
  # end


  # def edit
  #   @post =Comment.find(params[:post_id])
  #   @comment = @post.comment.find(params[:post_id])
  # end

  # def update
    
  #   @post = Comment.find(params[:post_id])
  #   if @comment.update(comment_params)
  #     redirect_to @post
  #   else
  #     render "edit"
  #   end
  # end

  def destroy
    @post =Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     @comment.destroy
      redirect_to post_path(@post)
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
