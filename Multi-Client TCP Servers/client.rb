require 'socket'

socket = TCPSocket.open("localhost", 3000)

puts "Starting the Client..................."
while message = socket.gets             # Read lines from the socket
	puts message.chomp
end

puts "Closing the Client..................."
socket.close                    # Close the socket