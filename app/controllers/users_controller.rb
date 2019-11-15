class UsersController < ApplicationController

    before_action :authenticate_user!
    
    
      def index
        @user = User.all
        @post= Post.all
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
        uploaded_file = params[:user][:cloud].path
        cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

      #store this public_id value to the database
      #cloudnary_file['public_id']

      # render json: cloudnary_file
      # p cloudnary_file
      s1 = cloudnary_file["public_id"]
      s2 = cloudnary_file["url"]

        @user.cloud_key = s1
        @user.cloud_url = s2
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