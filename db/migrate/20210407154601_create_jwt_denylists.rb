class CreateJwtDenylists < ActiveRecord::Migration[6.1]
  def change
    create_table    :jwt_denylists do |t|
      t.string      :jti, null: false
      t.timestamp   :expired_at, null: false

    end
    add_index :jwt_denylists, :jti
  end
end
