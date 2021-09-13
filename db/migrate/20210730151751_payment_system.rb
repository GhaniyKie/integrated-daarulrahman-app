class PaymentSystem < ActiveRecord::Migration[6.1]
  def change
    create_table    :expenses do |t|
      t.string      :payment_name
      t.integer     :amount
      t.string      :description
    end

    create_table    :invoices do |t|
      t.belongs_to  :student
      t.string      :transaction_id
      t.string      :order_id
      t.string      :merchant_id
      t.integer     :gross_amount
      t.string      :payment_type
      t.integer     :admin_fee
      t.string      :transaction_status
      t.string      :slug
      t.string      :signature_key
      t.string      :reference_number
      t.belongs_to  :admin
    end

    create_table    :invoice_items_details do |t|
      t.belongs_to  :expense
      t.belongs_to  :invoice
      t.belongs_to  :cart
      t.integer     :quantity
    end

    create_table    :carts do |t|
      t.timestamps
    end

    add_index :invoices, :transaction_id
    add_index :invoices, :order_id
    add_index :invoices, :reference_number
    add_index :invoices, :slug, unique: true
  end
end
