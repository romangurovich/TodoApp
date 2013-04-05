# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

goonies = Team.create(name: "Goonies")

goonies.users.create(username: "Chunk")
goonies.users.create(username: "Mikey")
goonies.users.create(username: "Mouth")

treasure = goonies.projects.create(name: "treasure")
treasure.items.create(title: "sloth",
                      description: "make friend with the sloth",
                      completed: true)
treasure.items.create(title: "ship", description: "find the pirate ship")


justice_league = Team.create(name: "Justice League")

justice_league.users.create(username: "Batman")
justice_league.users.create(username: "Superman")
justice_league.users.create(username: "Aquaman")

gotham = justice_league.projects.create(name: "Save Gotham",
                      description: "A city in ruin, on the verge of madness.")
gotham.items.create(title: "meow", description: "Get a date for Batman")
gotham.items.create(title: "operation joker", description: "A madman on the loose",
                    completed: true)
gotham.items.create(title: "riddle me this")
