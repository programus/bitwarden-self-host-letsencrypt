#!/usr/bin/env bash
echo "Creating key for personal CA"
echo ""
openssl genrsa -out myCA.key 2048
echo "Creating personal CA"
echo ""
openssl req -x509 -new -nodes -sha256 -days 3650 -key myCA.key -out myCA.crt
echo "Creating key for bitwarden certificate"
echo ""
openssl genpkey -algorithm RSA -out bitwarden.key -outform PEM -pkeyopt rsa_keygen_bits:2048
echo "Creating request for Bitwarden certificate"
echo ""
openssl req -new -key bitwarden.key -out bitwarden.csr
echo ""
echo -n "Please enter your FQDN: "
read answer
sed -i "s/bitwarden.local/$answer/g" bitwarden.ext
openssl x509 -req -in bitwarden.csr -CA myCA.crt -CAkey myCA.key -CAcreateserial -out bitwarden.crt -days 365 -sha256 -extfile bitwarden.ext
mkdir ./data/ssl
sudo cp bitwarden.crt ./data/ssl/
sudo cp bitwarden.key ./data/ssl/