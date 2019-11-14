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
          params.require(:user).permit(:email, :username, :profile_pic)
        end
    
    end 