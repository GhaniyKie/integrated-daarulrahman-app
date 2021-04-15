class API::V1::PaymentsController < API::APIController
    def index
        student = params[:student_id]
        @payments = Payment.where(student_id: student) if Student.find(student)
        render json: @payments
    end
    
    def show

    end
end