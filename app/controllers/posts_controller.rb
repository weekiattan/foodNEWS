class PostsController < ApplicationController
    before_action :authenticate_user!, :except => [ ]

    def index
        @post= Post.all
        @categories = Category.all
    end

    def show
        @categories = Category.all
        @post= Post.find(params[:id])
    end

    def new
      @categories = Category.all
    end

    def edit
        @post = Post.find(params[:id])

    end

    def create
        @categories = Category.all
        @post = Post.new(post_params)

        @post.user = current_user

        if @post.save
      #   render plain: params[:kopi].inspect
        redirect_to @post
        else
          @posts = Post.all


          render 'new'
      end
  end


    def update
        @post = Post.find(params[:id])

        @post.update(post_params)
        redirect_to @post
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :img_url, :description, :category_id)
  end