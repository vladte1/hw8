#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/mycerts/selfsigned.key -out /etc/ssl/mycerts/selfsigned.crt \
-config /etc/ssl/mycerts/myopenssl.cnf

sudo tee -a /etc/httpd/conf.d/ssl.conf << EOF
<VirtualHost *:443>
    DocumentRoot "/var/www/html"
    SSLEngine on
    SSLCertificateFile /etc/httpd/ssl/httpd-selfsigned.crt
    SSLCertificateKeyFile /etc/httpd/ssl/httpd-selfsigned.key
</VirtualHost>
EOF

sudo systemctl restart httpd
