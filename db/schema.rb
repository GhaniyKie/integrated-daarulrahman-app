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

ActiveRecord::Schema.define(version: 2021_08_01_065043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchequers", force: :cascade do |t|
    t.string "name"
    t.string "user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "payment_name"
    t.integer "amount"
    t.string "description"
  end

  create_table "invoice_items_details", force: :cascade do |t|
    t.bigint "expense_id"
    t.bigint "invoice_id"
    t.integer "quantity"
    t.index ["expense_id"], name: "index_invoice_items_details_on_expense_id"
    t.index ["invoice_id"], name: "index_invoice_items_details_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "student_id"
    t.string "transaction_id"
    t.string "order_id"
    t.string "merchant_id"
    t.integer "gross_amount"
    t.string "payment_type"
    t.integer "admin_fee"
    t.string "transaction_status"
    t.string "slug"
    t.string "signature_key"
    t.string "reference_number"
    t.bigint "exchequer_id"
    t.index ["exchequer_id"], name: "index_invoices_on_exchequer_id"
    t.index ["order_id"], name: "index_invoices_on_order_id"
    t.index ["reference_number"], name: "index_invoices_on_reference_number"
    t.index ["slug"], name: "index_invoices_on_slug", unique: true
    t.index ["student_id"], name: "index_invoices_on_student_id"
    t.index ["transaction_id"], name: "index_invoices_on_transaction_id"
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "expired_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "gender"
    t.bigint "nisn"
    t.string "student_number"
    t.integer "educational_status"
    t.integer "batch"
    t.integer "user_id"
    t.string "slug"
    t.index ["id"], name: "index_students_on_id"
    t.index ["nisn"], name: "index_students_on_nisn"
    t.index ["student_number"], name: "index_students_on_student_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.string "personal_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["personal_token"], name: "index_users_on_personal_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
