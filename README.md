# Bitwarden Self Host with  [Let's Encrypt](https://letsencrypt.org/)

This is a forked repository from [JulianRunnels/Bitwarden_Self_Host](https://github.com/JulianRunnels/Bitwarden_Self_Host), which is using certs created by [Let's Encrypt](https://letsencrypt.org/) so modern browsers will not show an exception. Also the default docker-compose.yml is for Raspberry Pi.

__To use the content of this project, a public domain for your server is NECESSARY. If you do not have a domain, you can get one or use the [original](https://github.com/JulianRunnels/Bitwarden_Self_Host) repository.__


This project is aimed at creating a private Bitwarden instance on your local LAN for devices on your personal network to be able to access. The docker-compose files contains 4 containers, the bitwarden unoffical rust backend, an nginx reverse proxy for HTTPS, the letsencrypt to generate or renew certs and a backup container. 

__PLEASE NOTE THAT THIS SETUP USES [BITWARDEN_RS](https://github.com/dani-garcia/bitwarden_rs) WHICH IS AN UNOFFICAL COMMUNITY CREATED BACKEND. IT IS REGULARLY UPDATED AND HAS SEVERAL ADVANTAGES INCLUDING ABILITY TO RUN ON RASPBERRY PI, A MUCH LOWER OVERALL RESOURCE FOOTPRINT, AND FULL BITWARDEN FUNCTIONALITY, INCLUDING PREMIUM FEATURES__

## To install ##
__Note: to install on a PC, you will need up update the tags for the containers in docker-compose.yml with the values in the comments of that page__

1. `git clone https://github.com/programus/bitwarden-self-host-letsencrypt.git`
2. `cd bitwarden-self-host-letsencrypt`
3. `sudo ./setup.sh`

The setup script will guide you complete your setup. 

Once you done the setup and ensure you have your domain and IP address set correctly, spin up the containers:
* `sudo docker-compose up -d`

You should now be able to access your instance at https://your.domain

> The `your.domain` here is the domain name you input while setting up. A public domain is NECESSARY. 


## Some details ##

By default, two directories will be created once the docker-compose is started:
* `data`: store the database for bitwarden and the backup.
* `proxy`: files necessary for nginx-proxy and Let's Encrypt certs generation.

