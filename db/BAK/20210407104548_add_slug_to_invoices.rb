# class AddSlugToInvoices < ActiveRecord::Migration[6.1]
#   def up
#     add_column :invoices, :slug, :string
#     add_index  :invoices, :slug, unique: true
#   end

#   def down
#     remove_column :invoices, :slug
#   end
# end
