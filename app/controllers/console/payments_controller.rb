class Console::PaymentsController < ApplicationController
    before_action :authenticate_user!

    # Dashboard untuk Bendahara, Santri
    def index
        student = from_current_user

        @invoices = student.invoices
        @payment_types = student.payment_type
        @payments_histories = student.payments


        @loans_details = @payment_types.group(:jenis_pembayaran).sum(:nominal_biaya)
        @loans_total = @loans_details.sum{|k, v| a = 0; a += v}
    end

    def index_invoice
        @invoices = from_current_user.invoices
    end
  
    def show_invoice
        
    end
  
    # def new
  
    # end
    
    # def create
  
    # end
  
    # def edit
  
    # end
  
    # def update
  
    # end
  
    # def delete
  
    # end


    private
  
    def resource_params
  
    end
end
