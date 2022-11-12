class CategoriesController < ApplicationController
  def create
  end

  def category_name
    # Category.all.map{|category| 
    #   ["#{category.name}", category.id]
    # }
    # params.require(:category_id).permit(:name)
  end
end