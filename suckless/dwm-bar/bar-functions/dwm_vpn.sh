#!/bin/sh

# A dwm_bar function to show VPN connections with OpenVPN or WireGuard (if any are active)
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, NetworkManager-openvpn (for OpenVPN connections)

#dwm_vpn () {
#    VPN=$(nmcli -a | grep 'VPN connection' | sed -e 's/\( VPN connection\)*$//g')
#    
#    if [ "$VPN" = "" ]; then
#        VPN=$(nmcli connection | grep 'wireguard' | sed 's/\s.*$//')
#    fi
#
#    if [ "$VPN" != "" ]; then
#        printf "%s" "$SEP1"
#        if [ "$IDENTIFIER" = "unicode" ]; then
#            printf "🔒 %s" "$VPN"
#        else
#            printf "VPN %s" "$VPN"
#        fi
#        printf "%s\n" "$SEP2"
#    fi
#}

dwm_vpn () {
    STATUS=$(nordvpn status)
    CITY=""
    COUNTRY=""
    IP=""
    CITY_STRING="City:"
    COUNTRY_STRING="Country:"
    IP_STRING="Your new IP:"

    if [[ "$STATUS" == *"Connected"* ]]; then
        while read line ;
        do
            if [[ "$line" == $COUNTRY_STRING* ]]; then
                COUNTRY=${line:${#COUNTRY_STRING}:${#line}}
            elif [[ "$line" == $IP_STRING* ]]; then
                IP=${line:${#IP_STRING}:${#line}}
            elif [[ "$line" == $CITY_STRING* ]]; then
                CITY=${line:${#CITY_STRING}:${#line}}
            fi
        done <<< $STATUS
        printf "[NVPN %s,%s :%s" "$CITY" "$COUNTRY" "$IP]"
    fi
}
 dwm_vpn
