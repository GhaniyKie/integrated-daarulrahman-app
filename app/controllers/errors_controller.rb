class ErrorsController < ApplicationController
    def not_found
        respond_to do |format|
            format.html{ render :template=>'/rescues/404', :status => 404 }
            # format.xml{  render :xml => 'Page Not Found',             :status => 404 }
            format.json{ render :json => 'Page Not Found',            :status => 404 }
        end  
    end
end