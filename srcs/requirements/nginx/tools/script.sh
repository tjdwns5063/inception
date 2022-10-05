#!/usr/bin/expect

spawn bash -c "openssl req -new -newkey rsa:2048 -nodes -keyout seongjki_cert.key -out seongjki_cert.csr";
expect -re "Country"
send "kr\n"
expect -re "State"
send "seoul\n"
expect -re "Locality"
send "seoul\n"
expect -re "Organization"
send "42seou\nl"
expect -re "Organizational Unit"
send "42\n"
expect -re "Common"
send "seongjki\n"
expect -re "Email"
send "seongjki.42.fr\n"
expect -re "challenge password"
send "4242\n"
expect -re "optional"
send "4242\n"
interact

spawn bash -c "openssl x509 -req -days 365 -in seongjki_cert.csr -signkey seongjki_cert.key -out seongjki_cert.crt";

spawn bash -c "mkdir /etc/nginx/ssl";
spawn bash -c "cp seongjki_cert.key /etc/nginx/ssl/";
spawn bash -c "cp seongjki_cert.crt /etc/nginx/ssl/";
expect eof;