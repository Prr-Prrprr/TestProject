ActiveAdmin.register Admin do
  permit_params :phone, :username, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :phone
    column :username
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :phone
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end  
end
