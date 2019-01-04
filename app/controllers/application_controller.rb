class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_responsible_users
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    # current_user.locale
    # request.env["HTTP_ACCEPT_LANGUAGE"]
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  # Alternative additing to Ability 
  def set_responsible_users
    if user_signed_in?
      @responsiblie = current_user.admin? || current_user.publisher?
    end
  end
end
