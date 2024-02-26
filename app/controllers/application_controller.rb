# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!
  after_action :record_url
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def record_url
    return unless current_user

    @event = Event.new
    @event.url = request.url
    @event.user_id = current_user.id
    @event.save
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[avatar email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar email password password_confirmation])
  end
end
