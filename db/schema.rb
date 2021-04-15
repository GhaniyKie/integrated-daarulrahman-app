# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_07_154601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "nama"
    t.string "user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "payment_type_id"
    t.string "id_tagihan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["id_tagihan"], name: "index_invoices_on_id_tagihan"
    t.index ["payment_type_id"], name: "index_invoices_on_payment_type_id"
    t.index ["slug"], name: "index_invoices_on_slug", unique: true
    t.index ["student_id"], name: "index_invoices_on_student_id"
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "expired_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "jenis_pembayaran"
    t.integer "nominal_biaya"
    t.string "deskripsi"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "payment_type_id"
    t.integer "admin_id"
    t.string "pembayaran_via"
    t.bigint "virtual_account"
    t.string "id_pembayaran"
    t.string "keterangan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_pembayaran"], name: "index_payments_on_id_pembayaran", unique: true
    t.index ["payment_type_id"], name: "index_payments_on_payment_type_id"
    t.index ["student_id"], name: "index_payments_on_student_id"
    t.index ["virtual_account"], name: "index_payments_on_virtual_account", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string "nama"
    t.integer "jenis_kelamin"
    t.bigint "nisn"
    t.integer "no_induk"
    t.integer "status_pendidikan"
    t.integer "angkatan"
    t.integer "user_id"
    t.string "slug"
    t.index ["id"], name: "index_students_on_id"
    t.index ["nisn"], name: "index_students_on_nisn"
    t.index ["no_induk"], name: "index_students_on_no_induk"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "peranan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "personal_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["personal_token"], name: "index_users_on_personal_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
