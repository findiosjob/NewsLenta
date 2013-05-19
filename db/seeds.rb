# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Joseppe', login: 'Jos', paswd:'123', is_admin: true )
User.create(name: 'Verdum', login: 'Verdum', paswd:'123', is_admin: false )
User.create(name: 'Antony', login: 'An', paswd:'123', is_admin: false )

