require 'socket'
portnumber = 2000
socketServer = TCPServer.open(portnumber)

while true
  Thread.new(socketServer.accept) do |connection|
    puts "Accepting connection from: #{connection.peeraddr[2]}"

    begin
      while connection
        incomingData = connection.gets(28.chr + 13.chr)
        if incomingData != nil
          incomingData = incomingData.chomp
        end

        puts "Incoming: #{incomingData}"
        puts "Sweet Ending"

        if incomingData == "SHUTDOWN#{28.chr + 13.chr}"
          puts "Received: DISCONNECT, closed connection"
          connection.close
          break
        else
          connection.puts "MSH|^~\\&|CPL|CPL|CBL|CBL|TODAYSDATE||||GUID#{28.chr}"
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

