class API::V1::InvoicesController < API::APIController
    before_action :authenticate_user!

    def index
        # Variabel local student hanya digunakan untuk menangkap id siswa di URL pada method GET
        # method order dengan parameter id: :desc menampilkan urutan id table unpaid_payments terbaru diatas
        student = Student.find(params[:student_id])
        @unpaids = student.invoices if student.id
        @total = student.payment_type.sum(:nominal_biaya)
    end

    def show
        @unpaid = Invoice.find(params[:id])
        @payment_type = @unpaid.payment_type
    end

    def new

    end

    def create

    end

end