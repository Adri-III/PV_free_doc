# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Appel des gems :
require 'faker'

# Permet de mettre la BdD vide, supprime le contenu donc :

specialties = ["Osthéo", "Kiné", "Chirurgien", "Dentiste", "Cardiologue"]

# Création de 'X' docteurs:
5.times do
  doctors = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: specialties.sample.to_s,
    zip_code: Faker::Address.zip_code
  )
end

# Création de 'X' patients :
10.times do
  patients = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Création de 'X' rendez-vous avec docteurs et patients aléatoires :
10.times do
  rand_id_doctor = rand(1..Doctor.all.length)
  rand_id_patient = rand(1..Doctor.all.length)
  appoints = Appointment.create(
    doctor: Doctor.find(rand_id_doctor),
    patient: Patient.find(rand_id_patient),
    date: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now + 365, format: :short)
  ) 
end

# Création de 'X' villes :
# 2.times do
#   rand_id_doctor = rand(1..Doctor.all.length)
#   rand_id_patient = rand(1..Doctor.all.length)
#   rand_id_appointment = rand(1..Appointment.all.length)
#   city = City.create(
#     doctor: Doctor.find(rand_id_doctor),
#     patient: Patient.find(rand_id_patient),
#     appointment: Appointment.find(rand_id_appointment),
#     city_name: Faker::Address.city
#   )
# end