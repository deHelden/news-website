# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([{ name: 'Sport' }, { name: 'Business' }, { name: 'Travell' }])
User.create!(
  [
    {
      email: 'admin@seed',
      admin: true,
      password: 'qwaszx',
      password_confirmation: 'qwaszx'
    },
    {
      email: 'publisher@seed',
      publisher: true,
      password: 'qwaszx',
      password_confirmation: 'qwaszx'
    },
    {
      email: 'correspondent@seed',
      correspondent: true,
      password: 'qwaszx',
      password_confirmation: 'qwaszx'
    },
    {
      email: 'registred@seed',
      password: 'qwaszx',
      password_confirmation: 'qwaszx'
    }
  ]
)
Visibility.create([{ name: 'All' }, { name: 'Registred' }, { name: 'Title&Description' }, { name: 'Title' }, { name: 'Hidden' }])
