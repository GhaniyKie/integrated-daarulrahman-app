require 'faker'
require 'factory_bot_rails'

module UserHelpers
    # FactoryBotCreate membuat memasukkan data ke Database pada Environment Test
    def create_user
        FactoryBot.create(:user,
        email: Faker::Internet.email,
        password: Faker::Internet.password)    
    end

    # FactoryBotBuild hanya membuat attribut pada Environment Test
    def build_user
        FactoryBot.build(:user,
        email: Faker::Internet.email,
        password: Faker::Internet.password)
    end
end