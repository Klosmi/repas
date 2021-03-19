require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  Survey.destroy_all
  Guest.destroy_all
  Event.destroy_all
  User.destroy_all
end

user= User.new(email:"lindak16@yahoo.fr", password:"password")
user.save

Event.create!(
        title: " Wedding Escale Borely ",
        date: 20210309,
        number_guest: 208,
        address: "79/81 Avenue de la Pointe Rouge, 13008 Marseille",
        user_id: user.id
        )

Event.create!(
        title: " Paul’s 60th Birthday ",
        date: 20210602,
        number_guest: 62,
        address: "122 rue de l'évêcher, 13002 Marseille",
        user_id: user.id
        )

 Event.create!(
        title: " Wedding  Andrea Nocelli ",
         date: 20210202,
         number_guest: 78,
         address: "164 Boulevard de Plombières, 13014 Marseille",
         user_id: user.id
         )

Event.create!(
         title: "Baby Shower Mr and Mrs Willi",
         date: 20210801,
         number_guest: 142,
         address: "19 Boulevard Louis Salvator, 13006 Marseille",
         user_id: user.id
         )


 Event.create!(
         title: "Seminar Company Brooms",
         date: 20201212,
         number_guest: 82,
         address: "117 Traverse de la Montre, 13011 Marseille",
         user_id: user.id
         )

 Event.create!(
         title: "Baptism Adam Junior",
         date: 20201203,
         number_guest: 45,
         address: "72 Chemin des Bessons, 13014 Marseille",
         user_id: user.id
         )

 500.times do
  event = Event.all.sample
  guest = Guest.create!(event_id:event.id, first_name:Faker::Name.first_name , last_name:Faker::Name.last_name, email:Faker::Internet.email)

  Survey.create!(
    nut: [true, false].sample,
    peanut: [true, false].sample,
    shellfish: [true, false].sample,
    egg: [true, false].sample,
    fish: [true, false].sample,
    soy: [true, false].sample,
    celery: [true, false].sample,
    sesame_seed: [true, false].sample,
    milk: [true, false].sample,
    sulphite: [true, false].sample,
    mustard: [true, false].sample,
    gluten: [true, false].sample,
    salt: [true, false].sample,
    sugar: [true, false].sample,
    hallal: [true, false].sample,
    casher: [true, false].sample,
    vegan: [true, false].sample,
    vegetarian: [true, false].sample,
    comment:"Please no #{Faker::Dessert.variety}",
    event_id: event.id ,
    guest_id: guest.id )
end
