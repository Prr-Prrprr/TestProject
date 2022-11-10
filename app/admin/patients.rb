ActiveAdmin.register Patient do
  
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

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :phone, :username, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :phone, :username, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
