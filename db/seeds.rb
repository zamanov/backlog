# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Regular", description: "Can't create, delete stories"})
r2 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
u1 = User.create({name: "Scrum", email: "user@mail.com", password: "qwerty12", password_confirmation: "qwerty12", role_id: r1.id})
u2 = User.create({name: "Product Owner", email: "admin@mail.com", password: "qwerty12", password_confirmation: "qwerty12", role_id: r2.id})
