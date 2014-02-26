# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140226232357) do

  create_table "admins_charities", force: true do |t|
    t.integer  "user_id"
    t.integer  "charity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins_charities", ["charity_id"], name: "index_admins_charities_on_charity_id"
  add_index "admins_charities", ["user_id"], name: "index_admins_charities_on_user_id"

  create_table "animal_details", force: true do |t|
    t.integer  "post_id"
    t.string   "name"
    t.string   "species"
    t.string   "color"
    t.string   "phone_no"
    t.string   "owner"
    t.string   "last_seen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "animal_details", ["post_id"], name: "index_animal_details_on_post_id"

  create_table "charities", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "email"
    t.string   "passcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charity_settings", force: true do |t|
    t.integer  "charity_id"
    t.string   "base_template",           default: "charity/default"
    t.string   "text_color"
    t.boolean  "enable_paypal_donations"
    t.string   "paypal_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "donations", force: true do |t|
    t.integer  "charity_id"
    t.float    "amount"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donations", ["charity_id"], name: "index_donations_on_charity_id"

  create_table "newsletter_subscriptions", force: true do |t|
    t.integer  "charity_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "newsletter_subscriptions", ["charity_id"], name: "index_newsletter_subscriptions_on_charity_id"
  add_index "newsletter_subscriptions", ["user_id"], name: "index_newsletter_subscriptions_on_user_id"

  create_table "post_photos", force: true do |t|
    t.integer  "post_id"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_photos", ["post_id"], name: "index_post_photos_on_post_id"

  create_table "post_tags", force: true do |t|
    t.integer  "post_id"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_tags", ["post_id"], name: "index_post_tags_on_post_id"

  create_table "posts", force: true do |t|
    t.integer  "charity_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["charity_id"], name: "index_posts_on_charity_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
