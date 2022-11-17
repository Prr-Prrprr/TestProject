class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def categories
    Category.all.map{|category| ["#{category.name}", category.id]}
  end
end