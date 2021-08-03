# Controller ini untuk menampilkan dan meng-claim data pribadi siswa setelah akun dibuat.
class AfterRegisterController < ApplicationController
    before_action :authenticate_user!
    def claim_profile
        @student = Student.find_by(nisn: params[:nisn])

        if @student.blank?
            @after_register_partial = 'after_register/partials/search_profile'
        else
            @after_register_partial = 'after_register/partials/profile_found'
        end
    end

    def connect_account_with_profile
        @student = Student.find_by(nisn: params[:nisn])

        if Student.where(user_id: current_user.id).any?
            @after_register_partial = 'after_register/partials/error_try_two_profile_one_account'
        elsif @student.user_id.blank?
            @student.user_id = current_user.id
            @student.save

            @after_register_partial = 'after_register/partials/success_link_account_with_profile'
        else
            @after_register_partial = 'after_register/partials/error_try_two_account_one_profile'

        end
    end

end