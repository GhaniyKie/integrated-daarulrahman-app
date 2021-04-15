class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.belongs_to  :student
      t.belongs_to  :payment_type
      t.string      :id_tagihan
      # t.integer     :id_tagihan

      t.timestamps
    end
    # add_index :invoices, [:student_id, :id_tagihan], unique: true
    add_index :invoices, :id_tagihan
  end
end
