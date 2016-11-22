#!/bin/bash
# First argument to pass is the name you want to add to your hosts


# Get local network IP
myip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk -F'[/ ]+' '{print $3}')

# Define list of hosts to add
rootIp=${myip%.*}.
hosts=""
for number in {1..255}
do
	hosts="$ips$rootIp$number $1.$number\n"
done

# Make a copy of /etc/hosts
sudo cp /etc/hosts /etc/hosts.bak
sudo awk -v var="$hosts" '/####/ { print; print var; next }1' /etc/hosts.bak > /tmp/newhosts

#Test hosts are ok

#replace /etc/hosts
sudo mv /tmp/newhosts /etc/hosts
sudo chown root:root /etc/hosts
sudo chmod 0644 /etc/hosts

