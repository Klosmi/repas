# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all if Rails.env.development?

user= User.new(email:"lindak15@yahoo.fr", password:"password")
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
