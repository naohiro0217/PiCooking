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
users = Customer.create!(
  [
    {
      email: "cook@cook",
      password: "cookcook",
      name: "太郎",
      introduction: "食べることが大好きです",
      nickname: "太郎",
      is_deleted: "false",
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg") ,
    }
    ]
      )

# 投稿
Cook.create!(
      title: 'お寿司',
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"),
      body: 'おいしかったです。',
      tag: "寿司",
      rate: "5",
      customer_id: users[0].id,
      )