require 'socket'

server_socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
# Socket::AF_INET - using IP protocol
# SOCK_STREAM - using TCP

socket_address = Socket.pack_sockaddr_in(8080, 'localhost')
server_socket.bind(socket_address)

server_socket.listen(5)
client_connection, client_connection_socket_address = server_socket.accept
puts client_connection
puts client_connection_socket_address

message = client_connection.recvfrom( 20 )[0]
puts "Data which is recieved from the #{client_connection} is #{message}"

client_connection.puts("Hi, You sent me #{message}")
sleep 10


server_socket.close


# telnet localhost 8080
# Connected to localhost.
#                Escape character is '^]'.
# 	                                 hello
# You said: hello