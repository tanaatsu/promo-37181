class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname,:email,:password,:last_name,:first_name,:telephone,:birthday,
                                                     :industry_id,:reason_id,:person_id,:prefecture_id,:business_id,:store_name,:area,:opening_hours,:store_appeal,:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:email,:password,:last_name,:first_name,:telephone,:birthday,
                                                      :industry_id,:reason_id,:person_id,:prefecture_id,:business_id,:store_name,:area,:opening_hours,:store_appeal,:image])
  end
end
