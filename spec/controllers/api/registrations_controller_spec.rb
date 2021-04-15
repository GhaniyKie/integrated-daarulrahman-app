require 'rails_helper'

describe RegistrationsController, type: :request do
    let (:user) { build_user }
    let (:existing_user) { create_user }
    let (:signup_url) { 'api/register' }

    context 'Ketika user membuat sebuah akun' do
        before do
            post signup_url, params: {
                user: {
                    email: user.email,
                    password: user.password
                }
            }
        end

        it 'mengembalikan respon 200 OK' do 
            expect(response.status).to eq(200)
        end

        it 'mengembalikan token otentikasi' do
            expect(response.headers['Authorization']).to be_present
        end
    end
end