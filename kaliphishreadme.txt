                ������ ������� ����� WPA Phish ��� ����-Linux

��� ��������� � ���� ������ ��, ��� ������ - ������ ������� � ��������� ��������

����� ���� ���������� ����������� � �������������� ������� ����-Linux ��� ����� ���������. ��� ������ �� �������� ������������ � ������������� ������, ����������:

     http://technicdynamic.com/2011/12/hacking-wpa-2-key-evil-twin-no-bruteforce

                !!!!!All credit for this work remains with them!!!!!

������������ �����:
��� � ���������� � mdk3 -g ����� � Aircrack-�� ����� ������������, ���� ������� ������ � ������� ��������� WPA ������� ������������ technicdynamic.com � ��������� � mdk3.
��� ����� ����-Linux ����� �� �����, ������� BT5R3, �� ����� �� ���������
�� ���������, � dhcp3-������ � ���� ��� ������ � ������� �� ISC-DHCP-�������. �� ���������� ������������ ISC-DHCP-������, �� �� ������ �������� ���������, ����� ���������������. �� �������� �� �� ����� �������� ��� ������ �������, ��� ����� ������ �� �������. �� ������ ������� ������� � ���������, ����� ������� ���� ���������� ������, ��� Dnsmasq ����� ���� ������������ � ������ ������������� ����������� �������� HTML-��������.

    ��� ������ ����� ���� ���������� ���������� �� WPA2 ������ ������ ����� ���������� �� WPA Enterprise ����� ����������� � ��������. �� ������ �������� ����� Verizon, ����� ���������������.

����� �����

   ���� ��������� ����� ��������� ������, �� �� ������������ ������������� ���� (2) ����������, ���� (1) ������ ��������� ������ � ��������� � ��������� � ������ ��������� mdk3. ����������� � ��������� ����� ���� ������������ ��� ���������.WiFi receivers� ��������� ��������� ������ � ��������� mdk3 ������ ������������ �������� �������.

   ����� ����, ��� ���� �.�. ���������������, softAP (����������: ������ �������� weakAP ��� rogueAP) � ����� �� ������ ������������ � �������������� ��������-��. �� ���������� ��� ��������� ����� � softAP �� ������� ����, ��� (3) ������ ������� ��� ����� �� ���� �� ��������� mdk3 �� ������������� � ������� softAPs "� �� ����������� ���� � ��� �� �����. �� ����� ���������� ��� ������� ��� �������� ��� softAP ����� ������ � ���� AP. ���������� � ����������������� 8 � B ����� ������, � ���� ������. ����� softAP ��������, ��������� ���� � ������� ����������, � ���� ��� ������ ������ mdk3 -g ��������� �� ����. ������� �� ������ ������������ � ������� AP � ����� �������������� � ������������ � softAP � ����� �� ��������� �� ������ ������. �� ����� ������ ������������ ���������-�� ������ mdk3. � ���������-�� �� ������ ��������� ��������� ������� �������� ������ � � �� ����� ��� ������ �������, ������� ����� ������������� ������ ����� ������������� �������� ����������� � ��������. ����� ������� ������������ � softAP � ���������� �������� � ����, ��� ������������ � ������������ ����������� �� WPA ���� ��-�� ��������� �� WPA ���� (�� ���-�������). ��� �� ����� ������� �� ���������, ��� MySQL ����� ������� ���� WPA ��� ���, ������� ����� ���� ����������� �������. ����� ����� ������� �� ��������� ���������� ������� ����������. ��������, ��, ��� �������, ������ ����� ���������� AP �������� � ������� �������, ����� ���������� ����������� ����������� ��������, ������ ��� �� �������� ��������� �������.

������� ��������� ����� ��������� ����������, �� �������� ��� ������� �:

         http://www.youtube.com/watch?v=2upq7Ks3tBY

   ���� ��������� ����� ���� ��������, ����� �� kaliphish.sh � �������� ��������� � ���� ���������. ���� ��������� �� �����������, �������� ���������� ��� �����, ����� ���� �������� � ���� ���������.��������� ����� ���������� ������������ ��� ��������� ����������, ����������� ��� �������� ����� ��������������. ������ �� ���� ��������� ��������� ���������� ������ ���� ����������� !!!

��������� kaliphish.sh

��� ��������� ���� �������������� �� ���� (3) �����������, ���������� ��� ����������� ���� � �� HDD � USB �������.

��� ���������� ���� ������� ����������� � �������������� ��������� ���������� �  /etc/apt/sources.list

deb http://http.kali.org/kali kali main contrib non-free
deb-src http://http.kali.org/kali kali main contrib non-free
deb http://security.kali.org/kali-security kali/updates main contrib non-free
deb-src http://security.kali.org/kali-security kali/updates main contrib non-free
deb http://http.kali.org /kali main contrib non-free
deb http://http.kali.org /wheezy main contrib non-free

�� ���������� ��� �������� ��������� � ���� ������ �� �����������

apt-get update

               =========================================

   Program requires that dnsmasq be installed in kali-linux. Type dnsmasq --help in the terminal window. If you get a help file the program is installed. If not type:

        apt-get install dnsmasq
 
And install the program. If you installed the dnsmasq with apt-get you can simply overwrite the /etc/dnsmasq.conf file with the dnsmasq.conf provided in this download OR got the existing etc/dnsmasq.conf, open the file with leafpad and got the following lines:

 "# interface (e.g. eth0) here."

 Remove the # sign and change to

interface=at0

Next got:

 "# agent. If you don't know what a DHCP relay agent is, you probably don't need to worry about this."

  Remove the # sign and leave:

dhcprange=192.168.0.50,192.168.0.150,255.255.255.0,12h

Remember the # acts as a remark and if present the computer ignores the line of code.

   If you did not install the dnsmasq program BUT when you type dnsmasq --help, the program responds, got the /etc folder and see if there is a dnsmasq.conf file present. If no file is seen simply copy the dnsmasq.conf file enclosed with this download to the /etc/ folder or write one:

Write these two(2) lines of code with leafpad:

interface=at0
dhcprange=192.168.0.50,192.168.0.150,255.255.255.0,12h

Name the file dnsmasq.conf and save it to the /etc/ folder

   You will find two(2) folders in the kaliphish download, a enterprise folder and a verizon folder. DO NOT remove the files from the folder!!! keep the files within these folders and copy both folders to /var/www folder. Remember to permit the files in these folders to act as programs. The kaliphish.sh will copy the verizon or enterprise folders' contents to the /var/www folder at program start, depending on the type of attack(i.e. enterprise or wpa2) selected by the user. This file handling should not conflict with other more advanced phishing programs like PwnSTAR_0.9 as we use the same file handling approach. You should backup any files in the /var/www folder before running this script as the kaliphish.sh program clears all files from the /etc/www folder before copying as referenced above.

How to install local area logos to the three(3) main html web pages in the verizon and enterprise folders.

    In the verizon and enterprise folders there are three(3) web pages in each folder.

   1. index.html
   2. update.html
   3. error.html


    To make these pages seem real you can install local area logos on each page. Download the logo you want from the net. For example you might download the logo for your local Telecoms. You now need to resize the logo.  We used mspaint in XP to resize. Click on the mspaint drop-down menu "image", then use stretch/skew and attributes to resize the pic down to around 200 by 100 pixel size. Save the file and place it in the verizon and enterprise folders.

    Open the index.html file with leafpad. You will find the following line:

<img src="placelogohere" alt="Verizon" align="center" />

  Place your logo file name like telcom.gif or test.jpg between the quotes. You would then see something like this:

<img src="logo.jpg" alt="Verizon" align="center" />

Click on the html file with your file manager and select display and see how the logo is positioned. Keep adjusting size till it looks good. Once you are satisfied with the pic then change the �placelogohere� to the �filenameoflogo� in all six(6) files found in the two(2) folders. Not placing a logo pic file name does not affect the running of this page. 

You are now ready to run the kaliphish.sh script file. You should have an internet connection running and separate wifi receiver that supports packet injection working on the computer running kaliphish.sh. You can place the file in root and click on it \. If the program does not run insure in the permissions block for the file allows this file to be executed as a program.

Work your way thru the script menus. An Eterm page will run when airbase-ng starts but the main terminal page will remain. A second Eterm page runs with iceweasel and can be ignored. After you enter the IP address wait for the webpage to appear then delimit the web page and you will see the mysql password prompt. Stop here!!!! and read below before continuing. 

Mysql

    The last routine in the script file deals with mysql which will store the phished password automatically for retrieval later. Read the prompts and copy and paste the commands.
    There are user/password issues with Kali, the reasons for which we do not wish to address here. However with respect to the kaliphish script we provide the following:
 
Kali may have a user name of "root" and a password of "toor"  but this may not be recognized by mysql. This can cause two(2) problems:

 1. When you get to the mysql password prompt and after typing your password the program fails(screen disappears), reboot the computer or restart the program and try hitting the "enter" key at the mysql password prompt.

    If mysql accepts an "Enter Key" command as the password instead of "toor"

    Got the savekey.php file in the verizon and enteprise folders and change:

    $password="toor"; // Mysql password
 to
    $password=""; // Mysql password

   Or if another password is used, change toor to that password.

If when testing the program you try and enter a wpa key in the web page and you get
    "Can't connect to db" error message the problem probably lies in the savekey.php files


     You will see the following when you get to the mysql password prompt. Suggest you review here

######################################################################

You are about to enter the mysql sub routine.
Run the following commands 
First enter the root password or hit enter if no password exists
You will get a mysql> prompt if password is correct
If program stops you have entered the wrong password
rerun the program"
Consult help files"
When you run the program the first time enter the
  four(4) commands below after the mysql> prompt
mysql>create database wpa2;
mysql>use wpa2
mysql>create table content(key1 VARCHAR(64), key2 VARCHAR(64));
mysql>select * from content;
========================
If data base already made type
mysql>use wpa2;
To see any passwords entered type
mysql>select * from content;

!!!!!READ ABOVE BETWEEN THE ############### BEFORE CONTINUING!!!!!"
#######################################################################"
mysql -u root -p

 
������ � �����������
1. ��, ��� ������, ����� ���������� ��� ��������� ������ �������������, ��� ��������-�� ��������� ������ ���������� -� �� --essid. �������� ��������, ��� -e �� ���� ����������� � ����� �������. ���� --essid ������������, �������� ��������, ���� �� ����������� � ������������ ��� � ��������, ��� Wi-Fi Hotspot � �.�. ���������� ������, ������� �� ������ Eterm �� ������ ��� ������������ -e.

2. ����������� �������, ����������� ��� ���� �������� ������ � ������� ����������� ��� ���-�������. ������� � ���� ������� � ��������� ��� ����� � �������� ��������� �������� ���� kaliphish.sh.

3. �� ������ ����� �������������� ����������� � ��������� � ��������� ������ ��������� �� ����� ��������������� ���������. ������ ������� � ����� ������� �� ����� ��������.

4. ��������� Dnsmasq ������� ��������-�� ��������� ��������� ����� ��� At0. ���� ��������� �� ��������� � ��������� ����������� ������ ���, ��������-�� �������� ����� ���������, ��1 � ��������� �� ����� ���������������. ����� ����, ���� Dnsmasq ��������, ����� ��������� ����������� ������ ���, Dnsmasq �� ����� ����������� � ������ 53. ��� ���������� ��������� ������� �������� ����������, ��� ��������-�� �������� Eterm �������� �� ������������� ���������� At0. �� ����� �������� �������������� �������� � ��������, ����� Dnsmasq ��������, ���� ���� 53 �� �������� ����������.
����� �������, ��� �� ������ ��� �������� � ������ ����������� � ������ ��������. �� ���� �������� �������� �� ������ ���� ������������� ��������� ��� ������������ ��������� �� ������������ ������� ����.
����������� ����������� �������, ���� � ��� ���� �������� ��������

airmon-ng check
airmon-ng check kill
kill  #enter PID numbers remaining

�������� ����

NetStat -utlnp

�� ������ ������������ ���� �������� ���� � ������� ������� ��������� �������:

������ ������ ���� ��������

��� �������������:

���� ������������ �������� ����������


5. �� �� ��������� �� ������ ������������ ��������� ������ � �������.


� ���������� �� ������ �� ������������� weaknet ����������� �� ������ � ��������� �����������. � �� ��������, ��� ������ ������� ������ ��������, �� �� ���� ��������� ���� ������.