import socket
import sys

port = int(sys.argv[1])
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', port))

request_header = 'GET /x HTTP/1.1\r\n' + \
'Host: localhost\r\n' + \
'Content-Type: text/plain\r\n' + \
'Content-Length: 2\r\n\r\n'

s.send(request_header.encode())
s.send('{}'.encode())

response = s.recv(1024)
print(response.decode())
