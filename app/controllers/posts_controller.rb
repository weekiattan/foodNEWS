class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @post= Post.all
        @categories = Category.all
        @reviews = Review.all
        @user = User.all
        @post = Post.search(params[:search])

    end

    def show
        @categories = Category.all
        @post= Post.find(params[:id])
        @review = Review.new
        @reviews = @post.review

        
    end

    def new
      @categories = Category.all
    end

    def edit
        @post = Post.find(params[:id])
        @categories = Category.all
        @user = User.all

      
    end

    def create

      uploaded_file = params[:post][:cloud].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

      #store this public_id value to the database
      #cloudnary_file['public_id']

      # render json: cloudnary_file
      # p cloudnary_file
      s1 = cloudnary_file["public_id"]
      s2 = cloudnary_file["url"]

        @categories = Category.all
        @post = Post.new(post_params)
        @post.cloud_key = s1
        @post.cloud_url = s2
        @post.user = current_user

        if @post.save
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
    params.require(:post).permit(:title, :description, :category_id, :rating)
  end