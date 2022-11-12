ActiveAdmin.register Category do
  permit_params :name
  
  show do
    attributes_table do
      row :name
    end
    active_admin_comments
  end

  filter :name, as: :select, collection: Category.all.map{|category| ["#{category.name}", category.id]}

end
