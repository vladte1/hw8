Hometask #8 (24/10)
- Create repo hometask8
- Create ec2 instance with AWS Linux (ami-01bc990364452ab3e)
  or Ubuntu 22.04
- setup Apache2 (httpd) server (in user data)
- check that inbound 80 and 443 port is open in your ec2 SG
- Place any site content to sever
- configure https on httpd server and restart it
- generate self-signed TLS certificate (put cert info to server via userdata).
  Do not forget use -config option for openssl command
- push your project to github (and add user sko-lv as colaborator
  Success criteria:
  Goto https://<your-ec2-ip>; http://<your-ec2-ip>
## How to start: 
aws ec2 run-instances \
--image-id ami-053b0d53c279acc90 \
--instance-type t2.micro \
--security-group-ids sg-087a411be8bacfad1\
--subnet-id subnet-00d298a49da8fc733 \
--associate-public-ip-address \
--user-data file://user-data.sh

or visit: https://ec2-18-209-50-201.compute-1.amazonaws.com/