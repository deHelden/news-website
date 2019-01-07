ActiveAdmin.register Comment do
  self.send(:include, Kaminari::ConfigurationMethods)

  def self.page(num = nil)
    limit(default_per_page).offset(default_per_page * ((num = num.to_i - 1) < 0 ? 0 : num)).extending do
      include Kaminari::ActiveRecordRelationMethods
      include Kaminari::PageScopeMethods
    end
  end
  
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
