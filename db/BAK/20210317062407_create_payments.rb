# class CreatePayments < ActiveRecord::Migration[6.1]
#   def change
#     create_table :payments do |t|
#       t.belongs_to  :student
#       t.belongs_to  :payment_type
#       t.integer   :admin_id
#       t.string    :pembayaran_via
#       t.bigint    :virtual_account
#       t.string    :id_pembayaran
#       t.string    :keterangan
      
#       t.timestamps
#     end
#     add_index :payments, :virtual_account, unique: true
#     add_index :payments, :id_pembayaran, unique: true
#   end
# end
