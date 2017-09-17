require 'socket'

puts "Starting the Server..................."
server = TCPServer.open(3000) # Server would listen on port 2000
loop{                         # Servers run forever
	client_connection = server.accept # Establish client connect connection
	Thread.start(client_connection) do |connection|
		connection.puts(Time.now) # Send the time to the client
		connection.puts("Closing the connection with #{client_connection}")
		connection.close      # Disconnect from the client
	end
}

