#!/bin/bash
if [ $(whoami) != "root" ]
then
    sudo $0 $@
    exit 0
fi

case $1 in
    start)
        route add -net 10.48.0.0 netmask 255.255.0.0 gw 15.34.40.1
        route add -net 15.34.0.0 netmask 255.255.0.0 gw 15.34.40.1
        route add -net 192.168.45.0 netmask 255.255.255.0 gw 15.34.40.1
        route add -net 22.0.0.0 netmask 255.255.0.0 gw 15.34.40.1
        route del default gw 15.34.40.1
        echo "server=/igrupobbva/interno.grupobbva.com/22.0.0.1" > /etc/NetworkManager/dnsmasq.d/bbva-dns.conf
        echo "server=/#/89.107.180.77" >> /etc/NetworkManager/dnsmasq.d/bbva-dns.conf
        echo "server=/#/89.107.180.92" >> /etc/NetworkManager/dnsmasq.d/bbva-dns.conf
        /etc/init.d/network-manager restart
    ;;
    stop)
               route del -net 10.48.0.0 netmask 255.255.0.0 gw 15.34.40.1
               route del -net 15.34.0.0 netmask 255.255.0.0 gw 15.34.40.1
               route del -net 192.168.45.0 netmask 255.255.255.0 gw 15.34.40.1
               route del -net 22.0.0.0 netmask 255.255.0.0 gw 15.34.40.1
               route del default gw 15.34.40.1
        rm -fr /etc/NetworkManager/dnsmasq.d/bbva-dns.conf
        /etc/init.d/network-manager restart
    ;;
esac
