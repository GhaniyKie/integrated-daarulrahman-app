class ApplicationController < ActionController::Base
    # Memproteksi sistem dari CSRF XSS Attack pada sesi web HTML, kecuali jika respon yang diminta JSON
    protect_from_forgery with: :exception, unless: :json_request?
    # Proteksi CSRF nonaktif jika Request berupa JSON
    protect_from_forgery with: :null_session, if: :json_request?


    # ErrorResponseAction adalah modul untuk menampilkan tampilan custom dari error-error umum
    include ErrorResponseActions
    rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found

    private

    def json_request?
        request.format.json?
    end

    # TODO:
    # rescue_from CanCan::AccessDenied, :with => :authorization_error
  
    # before_filter :authenticate!
  
    # private
  
    # def authenticate!
    #   current_user || devise_controller? || ( authentication_error and return false )
    # end
end
