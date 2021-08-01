class ChangeInvoiceColumnAdminIdToExchequerId < ActiveRecord::Migration[6.1]
  def up
    rename_column :invoices, :admin_id, :exchequer_id
  end

  def down
    rename_column :invoices, :exchequer_id, :admin_id
  end
end
