require 'socket'
socket = TCPSocket.new('localhost', 2000)
socket.send('some messagexdd', 0)
line = socket.gets('xdd')
  puts line

socket.send('something elsexdd', 0)
line = socket.gets('xdd')
  puts line
socket.send('SHUTDOWNxdd', 0)
socket.close
