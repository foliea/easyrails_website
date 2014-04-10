ActiveAdmin.register User do
  permit_params :email, :admin

  index do
    column :email
    column :provider
    column :admin
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin, label: "Administrator"
    end
    f.actions
  end

  edit = Proc.new do
    @user = User.find_or_create_by_id(params[:id])
    @user.admin = params[:user][:admin]
    @user.update_columns(admin: @user.admin) unless @user.save
    redirect_to action: :show, id: @user.id
  end
  
  member_action :update, method: :put, &edit
end
