ActiveAdmin.register User do

  permit_params :first_name, :last_name, :email, :phone,  :gender, :gender, :password, :password_confirmation, :admin, :roles => []


  form do |f|
    f.inputs "User" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :gender
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes, collection: User.roles_method
      f.input :admin, as: :boolean
    end
    f.actions
  end

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    actions
  end


  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :roles
      row :admin
      row :gender
      row :phone
    end
  end

end
