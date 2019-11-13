class ReviewsController < ApplicationController


  # def index
  #   @comments = @post.comments.order(created_at: :desc)
  # end

  def create
    p '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    p params[:review][:post]
    post_id = params[:post_id]
    p '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'

    @post = Post.find(params[:post_id])
    @review = Review.new(review_params)
    @review.post_id = post_id
    @review.user = current_user
    @review.save
    redirect_to post_path(@post)
    # @reviews = Review.all.where(post_id )

  end

  private

  def review_params
      params.require(:review).permit(:comments)
  end


end