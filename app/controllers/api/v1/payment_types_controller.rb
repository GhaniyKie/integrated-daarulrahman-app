class API::V1::PaymentTypesController < API::APIController
    def index
        @payment_types = PaymentType.all
    end
    
    def show
        @payment_type = PaymentType.find(params[:id])
    end

    def new

    end

    def create

    end

    def update

    end

    def destroy

    end
end