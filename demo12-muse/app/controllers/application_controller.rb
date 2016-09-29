class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  	# 添加了name字段，需要做一下设置才可以修改name字段。
  	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	  end
end
