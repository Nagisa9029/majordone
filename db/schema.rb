# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_25_123246) do

  create_table "blanc_parames", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "attack", default: 0, null: false
    t.integer "body", default: 0, null: false
    t.integer "color", default: 0, null: false
    t.integer "flavor", default: 0, null: false
    t.integer "fruit_flavor", default: 0, null: false
    t.integer "sweetness", default: 0, null: false
    t.integer "acidity", default: 0, null: false
    t.integer "taste", default: 0, null: false
    t.text "score_image", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_blanc_parames_on_user_id"
  end

  create_table "cart_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "purchase_num", default: 1
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["wine_id"], name: "index_cart_items_on_wine_id"
  end

  create_table "carts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "domaines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "flag"
    t.index ["name"], name: "index_domaines_on_name", unique: true
  end

  create_table "productimages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "wine_id", null: false
    t.text "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wine_id"], name: "index_productimages_on_wine_id"
  end

  create_table "rouge_parames", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "attack", default: 0, null: false
    t.integer "body", default: 0, null: false
    t.integer "color", default: 0, null: false
    t.integer "flavor", default: 0, null: false
    t.integer "fruit_flavor", default: 0, null: false
    t.integer "bitterness", default: 0, null: false
    t.integer "acidity", default: 0, null: false
    t.integer "tannin", default: 0, null: false
    t.integer "astringency", default: 0, null: false
    t.text "score_image", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_rouge_parames_on_user_id"
  end

  create_table "sepages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "kind"
    t.string "name", null: false
    t.string "name_spell"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kind"], name: "index_sepages_on_kind"
    t.index ["name"], name: "index_sepages_on_name", unique: true
    t.index ["name_spell"], name: "index_sepages_on_name_spell", unique: true
  end

  create_table "sparkling_parames", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "attack", default: 0, null: false
    t.integer "body", default: 0, null: false
    t.integer "color", default: 0, null: false
    t.integer "flavor", default: 0, null: false
    t.integer "fruit_flavor", default: 0, null: false
    t.integer "sweetness", default: 0, null: false
    t.integer "bitterness", default: 0, null: false
    t.integer "acidity", default: 0, null: false
    t.integer "taste", default: 0, null: false
    t.text "score_image", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sparkling_parames_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "family_name"
    t.string "first_name"
    t.string "family_name_kana"
    t.string "first_name_kana"
    t.date "birthday"
    t.integer "postal_code"
    t.string "region"
    t.string "street"
    t.integer "phone"
    t.integer "credit_card"
    t.boolean "user_flg", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_card"], name: "index_users_on_credit_card", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wine_sepages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "wine_id", null: false
    t.bigint "sepage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sepage_id"], name: "index_wine_sepages_on_sepage_id"
    t.index ["wine_id"], name: "index_wine_sepages_on_wine_id"
  end

  create_table "wine_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "group", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group"], name: "index_wine_types_on_group", unique: true
  end

  create_table "wines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_spell"
    t.text "title"
    t.text "comment"
    t.string "producer"
    t.bigint "wine_type_id", null: false
    t.bigint "domaine_id", null: false
    t.string "chator"
    t.integer "price"
    t.integer "attack"
    t.integer "body"
    t.integer "color"
    t.integer "flavor"
    t.integer "fruit_flavor"
    t.integer "sweetness"
    t.integer "bitterness"
    t.integer "acidity"
    t.integer "taste"
    t.integer "tannin"
    t.integer "astringency"
    t.text "score_image"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "taste_comment"
    t.boolean "wine_flg", default: false, null: false
    t.string "aoc"
    t.string "cuisine"
    t.index ["domaine_id"], name: "index_wines_on_domaine_id"
    t.index ["name"], name: "index_wines_on_name"
    t.index ["name_spell"], name: "index_wines_on_name_spell"
    t.index ["wine_type_id"], name: "index_wines_on_wine_type_id"
  end

end
