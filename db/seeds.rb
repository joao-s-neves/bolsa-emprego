# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProfessionalArea.create([{ name: 'Zoologia'}, { name: 'Informática'}, { name: 'Telecomunicações'}])
Habilitation.create([{name: 'Secundário'}, {name: "Licenciatura"}, {name: "Mestrado"}])
ProfessionalSituation.create([{ name: 'Empregado'}, { name: 'Desempregado'}])
ProfessionalActivity.create([{ name: 'Zoologia'}, { name: 'Informática'}, { name: 'Telecomunicações'}])
