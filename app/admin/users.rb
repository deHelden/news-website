ActiveAdmin.register User do
  scope_to :current_user, unless: proc{ current_user.admin? }
  send(:include, Kaminari::ConfigurationMethods)

  def self.page(num = nil)
    limit(default_per_page).offset(default_per_page * ((num = num.to_i - 1) < 0 ? 0 : num)).extending do
      include Kaminari::ActiveRecordRelationMethods
      include Kaminari::PageScopeMethods
    end
  end

  permit_params :email, :password, :password_confirmation, :admin, :publisher, :correspondent

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
      f.input :publisher
      f.input :correspondent
    end
    f.actions
  end
end
