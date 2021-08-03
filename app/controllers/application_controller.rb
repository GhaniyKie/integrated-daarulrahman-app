class ApplicationController < ActionController::Base
    # Memproteksi sistem dari CSRF XSS Attack pada sesi web HTML, kecuali jika respon yang diminta JSON
    protect_from_forgery with: :exception, unless: :json_request?
    # Proteksi CSRF nonaktif jika Request berupa JSON
    protect_from_forgery with: :null_session, if: :json_request?

    helper_method :from_current_user

    # ErrorResponseAction adalah modul untuk menampilkan tampilan custom dari error-error umum
    include ErrorResponseActions
    rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found
        
    private

    def json_request?
        request.format.json?
    end

    # Get Profile from Current User (Bendahara atau Santri)
    def from_current_user
        id = current_user.id
        user ||= Student.find_by(user_id: id) || Exchequer.find_by(user_id: id)
    end

    # TODO:
    # rescue_from CanCan::AccessDenied, :with => :authorization_error
  
    # before_filter :authenticate!
  
    # private
  
    # def authenticate!
    #   current_user || devise_controller? || ( authentication_error and return false )
    # end
end
