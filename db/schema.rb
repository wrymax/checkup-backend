# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181115215006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "questionnaire_submission_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["questionnaire_submission_id"], name: "index_answers_on_questionnaire_submission_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_questionnaires", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_questionnaires_on_patient_id"
    t.index ["questionnaire_id"], name: "index_patient_questionnaires_on_questionnaire_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "user_id"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.float "credits", default: 0.0
    t.index ["team_id"], name: "index_patients_on_team_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "questionnaire_submissions", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "questionnaire_id"
    t.string "digest_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["digest_key"], name: "index_questionnaire_submissions_on_digest_key"
    t.index ["patient_id"], name: "index_questionnaire_submissions_on_patient_id"
    t.index ["questionnaire_id"], name: "index_questionnaire_submissions_on_questionnaire_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.integer "company_id"
    t.integer "staff_id"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_sent_at"
    t.float "credits", default: 1.0
    t.float "points", default: 100.0
    t.index ["company_id"], name: "index_questionnaires_on_company_id"
    t.index ["staff_id"], name: "index_questionnaires_on_staff_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "question_type"
    t.jsonb "options"
    t.integer "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "company_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_staffs_on_company_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "points", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "phone"
    t.string "password_digest"
    t.string "auth_token"
    t.string "profile_type"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["auth_token"], name: "index_users_on_auth_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type"
  end

end
