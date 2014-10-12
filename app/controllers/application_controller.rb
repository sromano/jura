# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  rescue_from ActionController::ParameterMissing, with: :invalid_parameters

  def invalid_parameters
    flash[:error] = "Los parámetros son inválidos"
    redirect_to root_path
  end
end
