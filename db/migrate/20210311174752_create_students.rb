class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string   :name
      t.integer  :gender
      t.bigint   :nisn
      t.string   :student_number
      t.integer  :educational_status
      t.integer  :batch # Angkatan. Misalnya: 37, 38, ... 42
      t.integer  :user_id
      t.string   :slug
    end
    add_index :students, :nisn
    add_index :students, :student_number
    add_index :students, :id
  end
end
