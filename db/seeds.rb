anthony = User.first      || User.create!(name: 'Anthony', email: 'gay@jdr.fr', password: "I'm Gay")
losers  = Group.first     || Group.create!(name: 'Losers')
tonio   = Player.first    || Player.create!(group: losers, user: anthony)
zendark = Character.first || Character.create!(player: tonio, name: "Zendark le Gay")
