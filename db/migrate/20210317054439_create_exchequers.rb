class CreateExchequers < ActiveRecord::Migration[6.1]
  def change
    # Bendahara
    create_table :exchequers do |t|
      t.string :name
      t.string :user_id
    end
  end
end
