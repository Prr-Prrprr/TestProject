ActiveAdmin.register Doctor do
  permit_params :phone, :username, :password, :password_confirmation, :category_id

  show do
    attributes_table do
      row :username
      row :phone
      row :category
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
    end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column :username
    column :phone
    column :category
    actions
  end

  filter :phone
  filter :category_id, as: :select, collection: -> { Category.all.map{|category| ["#{category.name}", category.id]} }.call
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :phone
      f.input :username
      f.input :category_id, as: :select, collection: -> { Category.all.map{|category| ["#{category.name}", category.id]} }.call
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
