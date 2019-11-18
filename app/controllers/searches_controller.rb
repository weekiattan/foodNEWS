class SearchesController < ApplicationController
    def new
        @categories = Category.all
    end
    
    def create
        @search = Search.create(search_params)
        redirect_to @search
    end

    def show
        @search = Search.find(params[:id])
        # p @search.rating
        # p @search.category
        # p @search.keywords
        # @posts = Post.where("rating = ? OR category_id = ? OR title = ?",@search.rating,@search.category.to_i,@search.keywords)
        # # p @posts
        # p "///////////////////"

        @posts = Post.all
        if @search.rating == nil
        else
            @posts = @posts.where(rating: @search.rating)
        end
        
        @posts = @posts.where(category_id: @search.category)

        if @search.keywords == ''
        else
            @posts = @posts.search(@search.keywords)
        end

    end
    
    private

    def search_params
        params.require(:search).permit(:keywords, :rating, :category)
    end

end


