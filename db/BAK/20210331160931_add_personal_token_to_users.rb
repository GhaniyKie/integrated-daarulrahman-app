# class AddPersonalTokenToUsers < ActiveRecord::Migration[6.1]
#   def up
#     change_table :users do |t|
#       t.string :personal_token
#     end

#     add_index :users, :personal_token, unique: true
#   end
  
#   def down
#     remove_column :users, :personal_token
#   end
# end
