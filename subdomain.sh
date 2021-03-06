#!/bin/bash

#CREATED BY AMIR SHIATI 0ct 15 2020

SUBDOMAINNAME=$1
DOMAINUSER=$2
DOMAINNAME=$3
IPADDRESS=$4

mkdir /home/$DOMAINUSER/public_html/$SUBDOMAINNAME

cp ./samples/test.domain.conf /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$DOMAINNAME.conf
#uncommnet if you have a wildcard ssl certificate on your server
#cp ./samples/test.domain.ssl.conf /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$DOMAINNAME.ssl.conf

sed -i -e 's/!test!/'$SUBDOMAINNAME'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.conf
sed -i -e 's/!ip!/'$IPADDRESS'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.conf
sed -i -e 's/!domain!/'$DOMAINNAME'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.conf
sed -i -e 's/!ip!/'$IPADDRESS'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.conf
sed -i -e 's/!user!/'$DOMAINUSER'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.conf
sed -i -e 's/!ip!/'$IPADDRESS'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.conf

#uncommnet if you have a wildcard ssl certificate on your server
#sed -i -e 's/!test!/'$SUBDOMAINNAME'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.ssl.conf
#sed -i -e 's/!ip!/'$IPADDRESS'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.ssl.conf
#sed -i -e 's/!domain!/'$DOMAINNAME'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.ssl.conf
#sed -i -e 's/!ip!/'$IPADDRESS'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.ssl.conf
#sed -i -e 's/!user!/'$DOMAINUSER'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.ssl.conf
#sed -i -e 's/!ip!/'$IPADDRESS'/g' /usr/local/apache/conf.d/vhosts/$SUBDOMAINNAME.$$DOMAINNAME.ssl.conf

/usr/local/apache/bin/apachectl -k restart

cat ./samples/test.zone >> /var/named/$DOMAINNAME.db
sed -i -e 's/!test!/'$SUBDOMAINNAME'/g' /var/named/$DOMAINNAME.db
sed -i -e 's/!ip!/'$IPADDRESS'/g' /var/named/$DOMAINNAME.db

/usr/local/apache/bin/apachectl -k restart
service named restart


