class StudentsController < ApplicationController
    # Menampilkan keseluruhan attribut yang dimiliki santri
    def index
        @students = Student.all
    end

    # Menampilkan salah satu attribut yang dimiliki satri
    def show
        @student = Student.find(user_id: current_user.id).nama
        puts @student
    end

    # Membuat attribut untuk santri
    def new
        
    end

    # Menambahkan attribut ke sistem
    def create

    end

    # Mengedit attribut yang dimiliki santri
    def edit

    end

    # Membuat perubahan ke sistem
    def update
        
    end

    private

    def student_name(user)
        return Student.find(user_id: user.id).nama
    end

    def resource_params
        
    end

end