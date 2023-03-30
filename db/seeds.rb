# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

UserTournament.destroy_all
LineUp.destroy_all
Match.destroy_all
TeamMatch.destroy_all
TeamPolitic.destroy_all
Team.destroy_all
Politic.destroy_all
Tournament.destroy_all
User.destroy_all

# USERS SEEDS

password = "123456"

francis = User.create!(nickname: 'xalirius', email: 'becharafrancis@gmail.com', password: password)
herve = User.create!(nickname: 'RVNG64', email: 'herve.nguetsop@gmail.com', password: password)
gael = User.create(nickname: 'petitgork', email: 'gaelcarayon@hotmail.com', password: password)
marine = User.create(nickname: 'MarineC', email: 'marine_coltel@hotmail.fr', password: password)

# TOURNOIS SEEDS

tournament_1 = Tournament.create!(
  name: "Tournoi 1",
  status: "created",
  final_result: 0
)

tournament_2 = Tournament.create!(
  name: "Tournoi 2",
  status: "created",
  final_result: 0
)

# TEAMS SEEDS
  # Equipe du tournoi 1
team_francis_t1 = Team.create!(
  name: "team de francis du tournoi 1",
  number_of_politics: 10,
  user_id: francis.id,
  tournament_id: tournament_1.id
)

team_herve_t1 = Team.create!(
  name: "team de herve du tournoi 1",
  number_of_politics: 10,
  user_id: herve.id,
  tournament_id: tournament_1.id
)

  # Equipe du tournoi 2

team_francis_t2 = Team.create!(
  name: "team de francis du tournoi 2",
  number_of_politics: 10,
  user_id: francis.id,
  tournament_id: tournament_2.id
)

team_gael_t2 = Team.create!(
  name: "team de gael du tournoi 2",
  number_of_politics: 10,
  user_id: gael.id,
  tournament_id: tournament_2.id
)

# MATCHES SEEDS
  # Matchs du tournoi 1
match_t1_a = Match.create!(
  tournament_id: tournament_1.id,
  match_result: 0,
  statut: "Composition"
)

match_t1_b = Match.create!(
  tournament_id: tournament_1.id,
  match_result: 0,
  statut: "En cours"
)

match_t1_c = Match.create!(
  tournament_id: tournament_1.id,
  match_result: 0,
  statut: "Closed"
)

  # Matchs du tournoi 2
match_t2_a = Match.create!(
  tournament_id: tournament_2.id,
  match_result: 0,
  statut: "En cours"
)

match_t2_b = Match.create!(
  tournament_id: tournament_2.id,
  match_result: 0,
  statut: "Composition"
)

match_t2_c = Match.create!(
  tournament_id: tournament_2.id,
  match_result: 0,
  statut: "Closed"
)

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
  last_name: "Dupont-Aignan",
  politic_board: "Debout la France/",
  avatar: Faker::Avatar.image
)

wauquiez = Politic.create(
  first_name: "LauLau",
  last_name: "Wauquiez",
  politic_board: "Les Républicains",
  avatar: Faker::Avatar.image
)

# TEAMS_POLITICS SEEDS
  # Composition des equipes du tournoi 1 (4 persos / equipe)
teampolitic_francis_t1_p1 = TeamPolitic.create!(
  team_id: team_francis_t1.id,
  politic_id: wauquiez.id
)

teampolitic_francis_t1_p2 = TeamPolitic.create!(
  team_id: team_francis_t1.id,
  politic_id: macron.id
)

teampolitic_francis_t1_p3 = TeamPolitic.create!(
  team_id: team_francis_t1.id,
  politic_id: lepen.id
)

teampolitic_francis_t1_p4 = TeamPolitic.create!(
  team_id: team_francis_t1.id,
  politic_id: dupont_aignan.id
)

teampolitic_herve_t1_p1 = TeamPolitic.create!(
  team_id: team_herve_t1.id,
  politic_id: ruffin.id
)

teampolitic_herve_t1_p2 = TeamPolitic.create!(
  team_id: team_herve_t1.id,
  politic_id: philippot.id
)

teampolitic_herve_t1_p3 = TeamPolitic.create!(
  team_id: team_herve_t1.id,
  politic_id: melench.id
)

teampolitic_herve_t1_p4 = TeamPolitic.create!(
  team_id: team_herve_t1.id,
  politic_id: zemmour.id
)

  # Composition des equipes du tournoi 2 (4 persos / equipe)
teampolitic_francis_t2_p1 = TeamPolitic.create!(
  team_id: team_francis_t2.id,
  politic_id: ruffin.id
)

teampolitic_francis_t2_p2 = TeamPolitic.create!(
  team_id: team_francis_t2.id,
  politic_id: zemmour.id
)

teampolitic_francis_t2_p3 = TeamPolitic.create!(
  team_id: team_francis_t2.id,
  politic_id: philippot.id
)

teampolitic_francis_t2_p4 = TeamPolitic.create!(
  team_id: team_francis_t2.id,
  politic_id: melench.id
)

teampolitic_gael_t2_p1 = TeamPolitic.create!(
  team_id: team_gael_t2.id,
  politic_id: lepen.id
)

teampolitic_gael_t2_p2 = TeamPolitic.create!(
  team_id: team_gael_t2.id,
  politic_id: dupont_aignan.id
)

teampolitic_gael_t2_p3 = TeamPolitic.create!(
  team_id: team_gael_t2.id,
  politic_id: macron.id
)

teampolitic_gael_t2_p3 = TeamPolitic.create!(
  team_id: team_gael_t2.id,
  politic_id: wauquiez.id
)

# LINE-UPS SEEDS

#  Tournoi 1 - Line_ups (Francis vs Herve)
  # Match A
lineup_t1_ma_la = LineUp.create!(
  match_id: match_t1_a.id,
  politic_id: macron.id
)

lineup_t1_ma_lb = LineUp.create!(
  match_id: match_t1_a.id,
  politic_id: wauquiez.id
)

lineup_t1_ma_lc = LineUp.create!(
  match_id: match_t1_a.id,
  politic_id: melench.id
)

lineup_t1_ma_ld = LineUp.create!(
  match_id: match_t1_a.id,
  politic_id: ruffin.id
)

# Match B
lineup_t1_mb_la = LineUp.create!(
  match_id: match_t1_b.id,
  politic_id: macron.id
)

lineup_t1_mb_lb = LineUp.create!(
  match_id: match_t1_b.id,
  politic_id: lepen.id
)

lineup_t1_mb_lc = LineUp.create!(
  match_id: match_t1_b.id,
  politic_id: zemmour.id
)

lineup_t1_mb_ld = LineUp.create!(
  match_id: match_t1_b.id,
  politic_id: melench.id
)

# Match C
lineup_t1_mc_la = LineUp.create!(
  match_id: match_t1_c.id,
  politic_id: philippot.id
)

lineup_t1_mc_lb = LineUp.create!(
  match_id: match_t1_c.id,
  politic_id: ruffin.id
)

lineup_t1_mc_lc = LineUp.create!(
  match_id: match_t1_c.id,
  politic_id: dupont_aignan.id
)

lineup_t1_mc_ld = LineUp.create!(
  match_id: match_t1_c.id,
  politic_id: macron.id
)

# Tournoi 2 - line_ups (Gael vs Francis)
  # Match A
lineup_t2_ma_la = LineUp.create!(
  match_id: match_t2_a.id,
  politic_id: lepen.id
)

lineup_t2_ma_lb = LineUp.create!(
  match_id: match_t2_a.id,
  politic_id: ruffin.id
)

lineup_t2_ma_lc = LineUp.create!(
  match_id: match_t2_a.id,
  politic_id: wauquiez.id
)

lineup_t2_ma_ld = LineUp.create!(
  match_id: match_t2_a.id,
  politic_id: zemmour.id
)

#   Match B
lineup_t2_mb_la = LineUp.create!(
  match_id: match_t2_b.id,
  politic_id: macron.id
)

lineup_t2_mb_lb = LineUp.create!(
  match_id: match_t2_b.id,
  politic_id: melench.id
)

lineup_t2_mb_lc = LineUp.create!(
  match_id: match_t2_b.id,
  politic_id: wauquiez.id
)

lineup_t2_mb_ld = LineUp.create!(
  match_id: match_t2_b.id,
  politic_id: ruffin.id
)

#  Match C
lineup_t2_mc_la = LineUp.create!(
  match_id: match_t2_c.id,
  politic_id: ruffin.id
)

lineup_t2_mc_lb = LineUp.create!(
  match_id: match_t2_c.id,
  politic_id: lepen.id
)

lineup_t2_mc_lc = LineUp.create!(
  match_id: match_t2_c.id,
  politic_id: philippot.id
)

lineup_t2_mc_ld = LineUp.create!(
  match_id: match_t2_c.id,
  politic_id: dupont_aignan.id
)

# USER_TOURNAMENTS SEEDS
  # 2 joueurs / tournoi
usertournament_t1_francis = UserTournament.create!(
  user_id: francis.id,
  tournament_id: tournament_1.id
)

usertournament_t1_herve = UserTournament.create!(
  user_id: herve.id,
  tournament_id: tournament_1.id
)

usertournament_t2_francis = UserTournament.create!(
  user_id: francis.id,
  tournament_id: tournament_2.id
)

usertournament_t2_gael = UserTournament.create!(
  user_id: gael.id,
  tournament_id: tournament_2.id
)

# TEAM_MATCHES
  # Tournoi 1 - 3 matchs - 2 equipes s'affrontent
teammatches_t1_ma = TeamMatch.create!(
  team_id: team_francis_t1.id,
  match_id: match_t1_a.id
)

teammatches_t1_ma = TeamMatch.create!(
  team_id: team_herve_t1.id,
  match_id: match_t1_a.id
)

teammatches_t1_mb = TeamMatch.create!(
  team_id: team_francis_t1.id,
  match_id: match_t1_b.id
)

teammatches_t1_mb = TeamMatch.create!(
  team_id: team_herve_t1.id,
  match_id: match_t1_b.id
)

teammatches_t1_mc = TeamMatch.create!(
  team_id: team_francis_t1.id,
  match_id: match_t1_c.id
)

teammatches_t1_mc = TeamMatch.create!(
  team_id: team_herve_t1.id,
  match_id: match_t1_c.id
)

  # Tournoi 2 - 3 matchs - 2 equipes s'affrontent
teammatches_t2_ma = TeamMatch.create!(
  team_id: team_francis_t2.id,
  match_id: match_t2_a.id
)

teammatches_t2_ma = TeamMatch.create!(
  team_id: team_gael_t2.id,
  match_id: match_t2_a.id
)

teammatches_t2_mb = TeamMatch.create!(
  team_id: team_francis_t2.id,
  match_id: match_t2_b.id
)

teammatches_t2_mb = TeamMatch.create!(
  team_id: team_gael_t2.id,
  match_id: match_t2_b.id
)

teammatches_t2_mc = TeamMatch.create!(
  team_id: team_francis_t2.id,
  match_id: match_t2_c.id
)

teammatches_t2_mc = TeamMatch.create!(
  team_id: team_gael_t2.id,
  match_id: match_t2_c.id
)
