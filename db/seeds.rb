# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Todo.create([
    { item: "Sweep the floor", completed: true },
    { item: "Learn AJAX", completed: false },
    { item: "Meditate", completed: false }
])
