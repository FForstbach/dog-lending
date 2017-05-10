class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
    # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  #i18n
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale].try(:to_sym) || I18n.default_locale
  end

  def default_url_options
    {
    locale: I18n.locale == I18n.default_locale ? nil : I18n.locale,
    host: ENV["HOST"] || "localhost:3000" 
    }
  end

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location])
  end

end
