# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

program_main = Category.create(name: "プログラミング(本業)")
program_sub = Category.create(name: "プログラミング(副業)")
program_learn = Category.create(name: "プログラミング(学習)")
running = Category.create(name: "ランニング")
community = Category.create(name: "副業(ネットビジネス)")
other = Category.create(name: "その他")