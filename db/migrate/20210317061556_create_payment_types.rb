class CreatePaymentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_types do |t|
      t.string  :jenis_pembayaran
      t.integer :nominal_biaya
      t.string  :deskripsi
    end
  end
end
