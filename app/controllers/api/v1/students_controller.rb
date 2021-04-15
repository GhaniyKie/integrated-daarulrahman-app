class API::V1::StudentsController < API::APIController
    before_action :authenticate_user!
    
    def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
        @user = User.find_by(id:@student.user_id)
    end

end