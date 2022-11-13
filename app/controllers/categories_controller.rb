class CategoriesController < ApplicationController
  def create
  end

  def index
    @category_array = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @doctors = @category.doctors
  end
end