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

francis = User.create!(nickname: 'Xalirius', email: 'becharafrancis@gmail.com', password: password)
herve = User.create!(nickname: 'RVNG64', email: 'herve.nguetsop@gmail.com', password: password)
gael = User.create(nickname: 'Petitgork', email: 'gaelcarayon@hotmail.com', password: password)
marine = User.create(nickname: 'MarineC', email: 'marine_coltel@hotmail.fr', password: password)
julien = User.create(nickname: 'Jul', email: 'julien@gmail.com', password: password)
louis = User.create(nickname: 'Loulou', email: 'loulou@gmail.com', password: password)
lucas = User.create(nickname: 'Louk', email: 'louk@gmail.com', password: password)
sebastien = User.create(nickname: 'Seb', email: 'seb@gmail.com', password: password)
paul = User.create(nickname: 'Polo', email: 'polo@gmail.com', password: password)
pierre = User.create(nickname: 'Peio', email: 'peio@gmail.com', password: password)
jb = User.create(nickname: 'JB', email: 'jb@gmail.com', password: password)
laurent = User.create(nickname: 'Lolo', email: 'lolo@gmail.com', password: password)

# TOURNOIS SEEDS

tournament_1 = Tournament.create!(
  name: "Ligue des Senateurs",
  status: "created"
)
tournament_1.photo.attach(io:  File.open(File.join(Rails.root,'app/assets/images/tournoi_1.png')),
filename: 'tournoi_1.png')
# tournament_1.photo.attach(io: file, filename: "tournoi_1.png", content_type: "image/png")
tournament_1.save

tournament_2 = Tournament.create!(
  name: "La Guerre des Clans",
  status: "created"
)
tournament_2.photo.attach(io:  File.open(File.join(Rails.root,'app/assets/images/guerre_clans_tournoi.jpg')),
filename: 'guerre_clans_tournoi.jpg')
# tournament_2.photo.attach(io: file, filename: "guerre_clans_tournoi.jpg", content_type: "image/jpg")
tournament_2.save

tournament_3 = Tournament.create!(
  name: "Battle Royale",
  status: "created"
)
tournament_3.photo.attach(io:  File.open(File.join(Rails.root,'app/assets/images/battle_royale.jpg')),
filename: 'battle_royale.jpg')
# tournament_3.photo.attach(io: file, filename: "battle_royale.jpg", content_type: "image/jpg")
tournament_3.save

tournament_4 = Tournament.create!(
  name: "Highlanders",
  status: "created"
)
tournament_4.photo.attach(io:  File.open(File.join(Rails.root,'app/assets/images/highlanders.png')),
filename: 'highlanders.png')
# tournament_4.photo.attach(io: file, filename: "highlanders.png", content_type: "image/png")
tournament_4.save

tournament_5 = Tournament.create!(
  name: "Octogone League",
  status: "created"
)
tournament_5.photo.attach(io:  File.open(File.join(Rails.root,'app/assets/images/octogone.jpg')),
filename: 'octogone.jpg')
# tournament_5.photo.attach(io: file, filename: "octogone.jpg", content_type: "image/jpg")
tournament_5.save

tournament_6 = Tournament.create!(
  name: "League All In",
  status: "created"
)
tournament_6.photo.attach(io:  File.open(File.join(Rails.root,'app/assets/images/league_all_in.jpg')),
filename: 'league_all_in.jpg')
# tournament_6.photo.attach(io: file, filename: "league_all_in.jpg", content_type: "image/jpg")
tournament_6.save

# TEAMS SEEDS
  # Equipe du tournoi 1
team_francis_t1 = Team.create!(
  name: "Les Marcheurs Enflammes",
  user_id: francis.id,
  tournament_id: tournament_1.id
)

team_herve_t1 = Team.create!(
  name: "Les Sarko Flingueurs",
  user_id: herve.id,
  tournament_id: tournament_1.id
)

team_gael_t1 = Team.create!(
  name: "Les Gilets Jaunes",
  user_id: gael.id,
  tournament_id: tournament_1.id
)

team_marine_t1 = Team.create!(
  name: "Les Cope-cabana",
  user_id: marine.id,
  tournament_id: tournament_1.id
)

team_julien_t1 = Team.create!(
  name: "Les Marseillais",
  user_id: julien.id,
  tournament_id: tournament_1.id
)

team_louis_t1 = Team.create!(
  name: "Les Valls Angels",
  user_id: louis.id,
  tournament_id: tournament_1.id
)

  # Equipe du tournoi 2

team_francis_t2 = Team.create!(
  name: "Les Juppeters",
  user_id: francis.id,
  tournament_id: tournament_2.id
)

team_gael_t2 = Team.create!(
  name: "Les Macronautes",
  user_id: gael.id,
  tournament_id: tournament_2.id
)

team_pierre_t2 = Team.create!(
  name: "Les LePenistes Decomplexes",
  user_id: pierre.id,
  tournament_id: tournament_2.id
)

team_lucas_t2 = Team.create!(
  name: "Les Barbouzes de l'Assemblee",
  user_id: lucas.id,
  tournament_id: tournament_2.id
)

  # Equipe du tournoi 3

team_paul_t3 = Team.create!(
  name: "Les Fils de Poutine",
  user_id: paul.id,
  tournament_id: tournament_3.id
)

team_sebastien_t3 = Team.create!(
  name: "Les Fromages Qui Puent",
  user_id: sebastien.id,
  tournament_id: tournament_3.id
)

team_jb_t3 = Team.create!(
  name: "Les Marcheurs epuises",
  user_id: jb.id,
  tournament_id: tournament_3.id
)

team_laurent_t3 = Team.create!(
  name: "Les SM Insoumis",
  user_id: laurent.id,
  tournament_id: tournament_3.id
)

  # Equipe du tournoi 4

team_francis_t4 = Team.create!(
  name: "Les LR sur le Grill",
  user_id: francis.id,
  tournament_id: tournament_4.id
)

team_herve_t4 = Team.create!(
  name: "Les Poutou-Flingueurs",
  user_id: herve.id,
  tournament_id: tournament_4.id
)

team_gael_t4 = Team.create!(
  name: "Les Fillon-toutes-des-problemes",
  user_id: gael.id,
  tournament_id: tournament_4.id
)

team_marine_t4 = Team.create!(
  name: "Les Revers de la Force",
  user_id: marine.id,
  tournament_id: tournament_4.id
)

=begin
# MATCHES SEEDS
  # Matchs du tournoi 1
match_t1_a = Match.create!(
  tournament_id: tournament_1.id,
  statut: "Composition"
)

match_t1_b = Match.create!(
  tournament_id: tournament_1.id,
  statut: "En cours"
)

match_t1_c = Match.create!(
  tournament_id: tournament_1.id,
  statut: "Closed"
)

  # Matchs du tournoi 2
match_t2_a = Match.create!(
  tournament_id: tournament_2.id,
  statut: "En cours"
)

match_t2_b = Match.create!(
  tournament_id: tournament_2.id,
  statut: "Composition"
)

match_t2_c = Match.create!(
  tournament_id: tournament_2.id,
  statut: "Closed"
)
=end

# POLITICS SEEDS

macron = Politic.create(
  first_name: "Manu",
  last_name: "Macron",
  politic_board: "LREM",
  # avatar: Faker::Avatar.image
  punch_line: "S'ils veulent un responsable, il est devant vous. Qu'ils viennent me chercher"
)

lepen = Politic.create(
  first_name: "Marine",
  last_name: "Le Pen",
  politic_board: "RN",
  # avatar: Faker::Avatar.image
  punch_line: "De toute façon la France sera dirigée par une femme : ce sera, ou moi, ou Madame Merkel."
)

melench = Politic.create(
  first_name: "JL",
  last_name: "Mélenchon",
  politic_board: "La France Insoumise",
  # avatar: Faker::Avatar.image
  punch_line:'Personne ne me touche, ma personne est sacrée, je suis un parlementaire'
)

zemmour = Politic.create(
  first_name: "Eric",
  last_name: "Zemmour",
  politic_board: "Reconquête",
  # avatar: Faker::Avatar.image
  punch_line:"Regardez, dans les milieux où il y a vraiment le pouvoir, il n'y a pas de femmes."
)

ruffin = Politic.create(
  first_name: "François",
  last_name: "Ruffin",
  politic_board: "La France Insoumise",
  # avatar: Faker::Avatar.image
  punch_line:"La liberté c'est la sécurité, la sécurité c'est la surveillance, donc la liberté c'est la surveillance."
)

philippot = Politic.create(
  first_name: "Florian",
  last_name: "Philippot",
  politic_board: "Les Patriotes",
  # avatar: Faker::Avatar.image
  punch_line:"Des leçons de ce bonhomme, non !"
)

dupont_aignan = Politic.create(
  first_name: "Nicolas",
  last_name: "Dupont-Aignan",
  politic_board: "Debout la France/",
  # avatar: Faker::Avatar.image
  punch_line:"Alain Juppé était ministre du Budget lorsque j'étais étudiant en 1986."
)

wauquiez = Politic.create(
  first_name: "LauLau",
  last_name: "Wauquiez",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
  punch_line:"Être de droite, ce n’est pas une maladie honteuse."
)

quatennens = Politic.create(
  first_name: "Adrien",
  last_name: "Quatennens",
  politic_board: "La France Insoumise",
  # avatar: Faker::Avatar.image
  punch_line:"Je suis venu à la politique par frustration"
)

gluksmann = Politic.create(
  first_name: "Raphaël",
  last_name: "Gluksmann",
  politic_board: "Parti Populiste",
  # avatar: Faker::Avatar.image
)

bardella = Politic.create(
  first_name: "Jordan",
  last_name: "Bardella",
  politic_board: "Rassemblement National",
  # avatar: Faker::Avatar.image
)

asselineau = Politic.create(
  first_name: "François",
  last_name: "Asselineau",
  politic_board: "Union Populaire Républicaine",
  # avatar: Faker::Avatar.image
)

lisnard = Politic.create(
  first_name: "David",
  last_name: "Lisnard",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
)

autain = Politic.create(
  first_name: "Clémentine",
  last_name: "Autain",
  politic_board: "La France Insoumise",
  # avatar: Faker::Avatar.image
)

aubry = Politic.create(
  first_name: "Manon",
  last_name: "Aubry",
  politic_board: "La France Insoumise",
  # avatar: Faker::Avatar.image
)

darmanin = Politic.create(
  first_name: "Gérald",
  last_name: "Darmanin",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

ciotti = Politic.create(
  first_name: "Eric",
  last_name: "Ciotti",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
)

lassalle = Politic.create(
  first_name: "Jean",
  last_name: "Lassalle",
  politic_board: "Résistons",
  # avatar: Faker::Avatar.image
)

collard = Politic.create(
  first_name: "Gilbert",
  last_name: "Collard",
  politic_board: "Reconquête",
  # avatar: Faker::Avatar.image
)

attal = Politic.create(
  first_name: "Gabriel",
  last_name: "Attal",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

lemaire = Politic.create(
  first_name: "Bruno",
  last_name: "Lemaire",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

pecresse = Politic.create(
  first_name: "Valérie",
  last_name: "Pécresse",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
)

marechal = Politic.create(
  first_name: "Marion",
  last_name: "Maréchal",
  politic_board: "Rassemblement National",
  # avatar: Faker::Avatar.image
)

faure = Politic.create(
  first_name: "Olivier",
  last_name: "Faure",
  politic_board: "Parti Socialiste",
  # avatar: Faker::Avatar.image
)

roussel = Politic.create(
  first_name: "Fabien",
  last_name: "Roussel",
  politic_board: "Parti Communiste Français",
  # avatar: Faker::Avatar.image
)

obono = Politic.create(
  first_name: "Danièle",
  last_name: "Obono",
  politic_board: "La France Insoumise",
  # avatar: Faker::Avatar.image
)

corbiere = Politic.create(
  first_name: "Alexis",
  last_name: "Corbière",
  politic_board: "La France Insoumise",
  # avatar: Faker::Avatar.image
)

coquerel = Politic.create(
  first_name: "Eric",
  last_name: "Coquerel",
  politic_board: "La France Insoumise",
  # avatar: Faker::Avatar.image
)

bay = Politic.create(
  first_name: "Nicolas",
  last_name: "Bay",
  politic_board: "Rassemblement National",
  # avatar: Faker::Avatar.image
)

rousseau = Politic.create(
  first_name: "Sandrine",
  last_name: "Rousseau",
  politic_board: "Europe Ecologie Les Verts",
  # avatar: Faker::Avatar.image
)

bellamy = Politic.create(
  first_name: "François-Xavier",
  last_name: "Bellamy",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
)

messiha = Politic.create(
  first_name: "Jean",
  last_name: "Messiha",
  politic_board: "Reconquête",
  # avatar: Faker::Avatar.image
)

estrosi = Politic.create(
  first_name: "Christian",
  last_name: "Estrosi",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
)

poutou = Politic.create(
  first_name: "Philippe",
  last_name: "Poutou",
  politic_board: "Nouveau Parti Anticapitaliste",
  # avatar: Faker::Avatar.image
)

piolle = Politic.create(
  first_name: "Eric",
  last_name: "Piolle",
  politic_board: "Europe Ecologie Les Verts",
  # avatar: Faker::Avatar.image
)

philippe = Politic.create(
  first_name: "Edouard",
  last_name: "Philippe",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

hidalgo = Politic.create(
  first_name: "Anne",
  last_name: "Hidalgo",
  politic_board: "Parti Socialiste",
  # avatar: Faker::Avatar.image
)

veran = Politic.create(
  first_name: "Olivier",
  last_name: "Véran",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

jadot = Politic.create(
  first_name: "Yannick",
  last_name: "Jadot",
  politic_board: "Europe Ecologie Les Verts",
  # avatar: Faker::Avatar.image
)

bayou = Politic.create(
  first_name: "Julien",
  last_name: "Bayou",
  politic_board: "Europe Ecologie Les Verts",
  # avatar: Faker::Avatar.image
)

cazeneuve = Politic.create(
  first_name: "Bernard",
  last_name: "Cazeneuve",
  politic_board: "Parti Socialiste",
  # avatar: Faker::Avatar.image
)

o = Politic.create(
  first_name: "Cédric",
  last_name: "O",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

castex = Politic.create(
  first_name: "Jean",
  last_name: "Castex",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

aliot = Politic.create(
  first_name: "Louis",
  last_name: "Aliot",
  politic_board: "Rassemblement National",
  # avatar: Faker::Avatar.image
)

blanquer = Politic.create(
  first_name: "Jean-Michel",
  last_name: "Blanquer",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

hollande = Politic.create(
  first_name: "François",
  last_name: "Hollande",
  politic_board: "Parti Socialiste",
  # avatar: Faker::Avatar.image
)

sarkozy = Politic.create(
  first_name: "Nicolas",
  last_name: "Sarkozy",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
)

bertrand = Politic.create(
  first_name: "Xavier",
  last_name: "Bertrand",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
)

montebourg = Politic.create(
  first_name: "Arnaud",
  last_name: "Montebourg",
  politic_board: "Parti Socialiste",
  # avatar: Faker::Avatar.image
)

valls = Politic.create(
  first_name: "Manuel",
  last_name: "Valls",
  politic_board: "Parti Socialiste",
  # avatar: Faker::Avatar.image
)

borne = Politic.create(
  first_name: "Elisabeth",
  last_name: "Borne",
  politic_board: "La République en Marche",
  # avatar: Faker::Avatar.image
)

besancenot = Politic.create(
  first_name: "Olivier",
  last_name: "Besancenot",
  politic_board: "Nouveau Parti Anticapitaliste",
  # avatar: Faker::Avatar.image
)

morano = Politic.create(
  first_name: "Nadine",
  last_name: "Morano",
  politic_board: "Les Républicains",
  # avatar: Faker::Avatar.image
)

aubry = Politic.create(
  first_name: "Martine",
  last_name: "Aubry",
  politic_board: "Parti Socialiste",
  # avatar: Faker::Avatar.image
)

taubira = Politic.create(
  first_name: "Christiane",
  last_name: "Taubira",
  politic_board: "Parti Socialiste",
  # avatar: Faker::Avatar.image
)

=begin
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
=end

# USER_TOURNAMENTS SEEDS
usertournament_t1_francis = UserTournament.create!(
  user_id: francis.id,
  tournament_id: tournament_1.id
)

usertournament_t1_herve = UserTournament.create!(
  user_id: herve.id,
  tournament_id: tournament_1.id
)

usertournament_t1_gael = UserTournament.create!(
  user_id: gael.id,
  tournament_id: tournament_1.id
)

usertournament_t1_marine = UserTournament.create!(
  user_id: marine.id,
  tournament_id: tournament_1.id
)

usertournament_t1_julien = UserTournament.create!(
  user_id: julien.id,
  tournament_id: tournament_1.id
)

usertournament_t1_louis = UserTournament.create!(
  user_id: louis.id,
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

usertournament_t2_pierre = UserTournament.create!(
  user_id: pierre.id,
  tournament_id: tournament_2.id
)

usertournament_t2_lucas = UserTournament.create!(
  user_id: lucas.id,
  tournament_id: tournament_2.id
)

usertournament_t3_paul = UserTournament.create!(
  user_id: paul.id,
  tournament_id: tournament_3.id
)

usertournament_t3_sebastien = UserTournament.create!(
  user_id: sebastien.id,
  tournament_id: tournament_3.id
)

usertournament_t3_jb = UserTournament.create!(
  user_id: jb.id,
  tournament_id: tournament_3.id
)

usertournament_t3_laurent = UserTournament.create!(
  user_id: laurent.id,
  tournament_id: tournament_3.id
)

usertournament_t4_francis = UserTournament.create!(
  user_id: francis.id,
  tournament_id: tournament_4.id
)

usertournament_t4_herve = UserTournament.create!(
  user_id: herve.id,
  tournament_id: tournament_4.id
)

usertournament_t4_gael = UserTournament.create!(
  user_id: gael.id,
  tournament_id: tournament_4.id
)

usertournament_t4_marine = UserTournament.create!(
  user_id: marine.id,
  tournament_id: tournament_4.id
)

=begin
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
=end
