class UsersController < ApplicationController

    before_action :authenticate_user!
    
    
      def index
        @user = User.all
        @post= Post.all
        @post = Post.search(params[:search])
      end
    
      def show
        @user = User.find(params[:id])
        @post= Post.all
        
      end

      
    
      def edit
        @user = User.find(params[:id])
        
      end
    
      def update
        @user = User.find(params[:id])
        if params[:user].key?("cloud")
          uploaded_file = params[:user][:cloud].path
          cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
          s1 = cloudnary_file["public_id"]
          s2 = cloudnary_file["url"]

          @user.cloud_key = s1
          @user.cloud_url = s2
        end

      
      
        if @user.update(user_params)
          redirect_to @user
        else
          render action: :edit
        end
    

      def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to root_path
        end
      end
    
      private
        def user_params
          params.require(:user).permit(:email, :username)
        end
    
    end 