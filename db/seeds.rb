# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.first
@user.profiles.create(financial_goal: 1000, current_balance: 100)
@game1 = Game.create(name: "fixed deposit")
@game2 = Game.create(name: "unit trust")
@game3 = Game.create(name: "stock")