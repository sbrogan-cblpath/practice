require 'socket'
portnumber = 2000
socketServer = TCPServer.open(portnumber)

while true
  Thread.new(socketServer.accept) do |connection|
    puts "Accepting connection from: #{connection.peeraddr[2]}"

    begin
      while connection
        incomingData = connection.gets("xdd")
        if incomingData != nil
          incomingData = incomingData.chomp
        end

        puts "Incoming: #{incomingData}"
        puts "Sweet Ending"

        if incomingData == "SHUTDOWNxdd"
          puts "Received: DISCONNECT, closed connection"
          connection.close
          break
        else
          connection.puts "#{incomingData.gsub('xdd','')}"
          connection.puts "More Dataxdd"
          connection.flush
        end
      end
    rescue Exception => e
      # Displays Error Message
      puts "#{ e } (#{ e.class })"
    ensure
      connection.close
      puts "ensure: Closing"
    end
  end
end

