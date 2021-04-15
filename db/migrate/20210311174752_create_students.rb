class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string  :nama
      t.integer :jenis_kelamin
      t.bigint  :nisn
      t.integer :no_induk
      t.integer :status_pendidikan
      t.integer :angkatan # Misalnya: 37, 38, ... 42
      t.integer :user_id
    end
    add_index :students, :nisn
    add_index :students, :no_induk
    add_index :students, :id
  end
end
