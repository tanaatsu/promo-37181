class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname,:email,:password,:last_name,:first_name,:telephone,:birthday,:occupation_id,
                                                     :industry_id,:reason_id,:person_id,:store_name,:area,:opening_hours])
  end
end
