# -*- coding: utf-8 -*-
import socket

target_host = "192.168.59.32"
target_port = 8888


client = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
client.connect((target_host,target_port))
client.send("GET / HTTP/1.1\r\nHOST:192.168.59.32\r\n\r\n")

response = client.recv(4096)

print response
