# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者の情報の初期設定
Admin.create(
  email: "admin@admin",
  password: "adminadmin"
  )

# 会員側の情報の初期設定
Customer.create(
  [
    {
      email: "cook@cook",
      password: "cookcook",
      name: "料理太郎",
      introduction: "食べることが大好きです",
      nickname: "テスト１",
      is_deleted: "false",
    },
    {
      email: "eat@eat",
      password: "eatear",
      name: "料理二郎",
      nickname: "テスト２",
      is_deleted: "false",
    }
  ]
)