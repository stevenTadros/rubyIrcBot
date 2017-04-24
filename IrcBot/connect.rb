require 'ircBot.rb'

bot = Pol.new("XXXXXX", XXXX, 'XXXXXX', '+XXXX', XXX, 'NICK XXXXX', 'USER XXXXXXXX')
# server, port, channel, port_ssl, ssl, nick, user
# replace XXX with your unformation
trap("INT"){ bot.quit }

bot.run