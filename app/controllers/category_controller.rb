class CategoryController < ApplicationController
    before_action :authenticate_request
    def show_all_categories
         render json: Category.all
    end
    def add_category
        Category.create(name: params[:name])
    end
end
