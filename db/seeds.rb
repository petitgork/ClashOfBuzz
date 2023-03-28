# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

UserMatch.destroy_all
UserTournament.destroy_all
LineUp.destroy_all
Match.destroy_all
TeamPolitic.destroy_all
Team.destroy_all
Politic.destroy_all
Tournament.destroy_all
User.destroy_all

# USERS SEEDS

password = "123456"
User.create!(nickname: 'xalirius', email: 'becharafrancis@gmail.com', password: password)
User.create!(nickname: 'RVNG64', email: 'herve.nguetsop@gmail.com', password: password)
User.create(nickname: 'petitgork', email: 'gaelcarayon@hotmail.com', password: password)
User.create(nickname: 'MarineC', email: 'marine_coltel@hotmail.fr', password: password)

# TOURNOIS SEEDS

5.times do
  tournament = Tournament.new(
    name: Faker::Beer.brand,
    status: ["created", "launched", "finished"].sample,
    final_result: (0..10_000).to_a.sample
  )
  tournament.save!
end

# TEAMS SEEDS

5.times do
  team = Team.new(
    name: Faker::Beer.name,
    number_of_politics: (3..5).to_a.sample,
    avatar: Faker::Avatar.image,
    user_id: User.all.sample.id,
    tournament_id: Tournament.all.sample.id
  )
  team.save!
end

# MATCHES SEEDS

5.times do
  match = Match.new(
    tournament_id: Tournament.all.sample.id,
    match_result: (0..500).to_a.sample
  )
  match.save!
end

# POLITICS SEEDS

macron = Politic.create(
  first_name: "Manu",
  last_name: "Macron",
  politic_board: "LREM",
  avatar: Faker::Avatar.image
)

lepen = Politic.create(
  first_name: "Marine",
  last_name: "Le Pen",
  politic_board: "RN",
  avatar: Faker::Avatar.image
)

melench = Politic.create(
  first_name: "JL",
  last_name: "Mélenchon",
  politic_board: "La France Insoumise",
  avatar: Faker::Avatar.image
)

zemmour = Politic.create(
  first_name: "Eric",
  last_name: "Zemmour",
  politic_board: "Reconquête",
  avatar: Faker::Avatar.image
)

ruffin = Politic.create(
  first_name: "François",
  last_name: "Ruffin",
  politic_board: "La France Insoumise",
  avatar: Faker::Avatar.image
)

philippot = Politic.create(
  first_name: "Florian",
  last_name: "Philippot",
  politic_board: "Les Patriotes",
  avatar: Faker::Avatar.image
)

dupont_aignan = Politic.create(
  first_name: "Nicolas",
  last_name: "Dupont6Qignqn",
  politic_board: "Debout la France/",
  avatar: Faker::Avatar.image
)

wauquiez = Politic.create(
  first_name: "LauLau",
  last_name: "Wauquiez",
  politic_board: "Les Républicains",
  avatar: Faker::Avatar.image
)

# LINE-UPS SEEDS

20.times do
  lineup = LineUp.new(
    match_id: Match.all.sample.id,
    politic_id: Politic.all.sample.id
  )
  lineup.save!
end

# TEAMS_POLITICS SEEDS

5.times do
  teampolitic = TeamPolitic.new(
    team_id: Team.all.sample.id,
    politic_id: Politic.all.sample.id
  )
  teampolitic.save!
end

# USER_TOURNAMENTS SEEDS

5.times do
  usertournament = UserTournament.new(
    user_id: User.all.sample.id,
    tournament_id: Tournament.all.sample.id
  )
  usertournament.save!
end

# USER_MATCHES SEEDS

5.times do
  usermatches = UserMatch.new(
    user_id: User.all.sample.id,
    match_id: Match.all.sample.id
  )
  usermatches.save!
end
