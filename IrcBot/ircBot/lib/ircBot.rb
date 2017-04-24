require "ircBot/version"
require 'socket'

module IrcBot
end

class Pol
	extend IrcBot
# connection ssl
	def initialize(server, port, channel, ssl_port, ssl, nick, user)
      @channel = channel
      port = ssl_port if ssl
      socket = TCPSocket.new(server, port)
      if ssl
      require 'openssl'
      ssl = OpenSSL::SSL::SSLContext.new
      ssl.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @socket = OpenSSL::SSL::SSLSocket.new(socket, ssl)
      @socket.sync = true
      @socket.connect
    say(nick)
    say(user)
  end
end
# define send function
  def say(msg)
    puts msg
    @socket.puts msg
  end
# calculate the square root of the first number and multiply by the second number
  def calcul(nb, nb2)
    arr = ("%.2f" %(Math.sqrt(Float(nb)) * Float(nb2)))
    say("PRIVMSG Candy !ep1 -rep "+arr.to_s)
  end
# check what happend on irc
  def run
      while data = @socket.gets
      puts "<-- #{data}"
      input = data.split(' ')
# matching condition      
        say("PONG #{input[1]}") if input[0] == 'PING'
   #  when loading is complete we go to the specific channel
        say("JOIN ##{@channel}") if input[1] == '396'
   #  send private message to a bot
        say("PRIVMSG Candy !ep1") if input[1] == '366'
# if answer is good say thanks and quit
        if input[3] == ':You'
          say("PRIVMSG Candy Thanks Candy") 
          say 'QUIT :Bye Bye...'
        end
   # if the bot answer we take the parameter and call the calcul function
        if input[1] == 'PRIVMSG' && input[3] != ':You'
          nb = input[3].delete ":"
          nb2 = input[5]
          calcul(nb, nb2)
        end
    end
  end
# if exit
  def quit
    say "PART ##{@channel} :Bye Bye..."
    say 'QUIT'
  end
end