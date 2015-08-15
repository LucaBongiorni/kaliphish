                Мушкет команды Альфы WPA Phish для Кали-Linux

    Принесите в поле зрения то, что скрыто - группа хакеров и удаленных зрителей

 Цель этой публикации заключается в предоставлении вариант Кали-Linux Для этого нападения. Эта работа не является оригинальной и переписывание подход, изложенный:

     http://technicdynamic.com/2011/12/hacking-wpa-2-key-evil-twin-no-bruteforce

                !!!!!All credit for this work remains with them!!!!!

Исторический обзор:
    С появлением в mdk3 -g атаки в Aircrack-нг набор инструментов, наша команда начала с помощью программы WPA фишинга составленный technicdynamic.com в сочетании с mdk3.
    Когда Кали-Linux вышел на сцену, заменяя BT5R3, мы нашли бы программа
не запускать, а dhcp3-сервер в Кали был удален и заменен на ISC-DHCP-сервера. Мы попытались использовать ISC-DHCP-сервер, но не смогли получить программу, чтобы функционировать. Мы испытали те же самые проблемы как другие считают, что можно видеть на форумах. Мы искали простое решение и обнаружил, через помощью Кали участников форума, что Dnsmasq могут быть использованы и полное переписывание последовало включить HTML-страницы.

    Это фишинг атака была изначально направлена на WPA2 однако модуль атака направлена на WPA Enterprise также встроенного в сценарии. Мы просто изменили файлы Verizon, чтобы соответствовать.

Обзор Атака

   Один компьютер может выполнить задачи, но мы предпочитаем использовании двух (2) компьютера, один (1) Летние программы фишинг и подключен к Интернету и второй проточной mdk3. Подключение к интернету может быть беспроводной или проводной.WiFi receivers▓ поддержке программы фишинг и программы mdk3 должен поддерживать инъекции пакетов.

   После того, как цель А.П. идентифицирован, softAP (примечание: иногда называют weakAP или rogueAP) с таким же именем производится с использованием авиабазы-нг. Мы предлагаем вам назначить канал в softAP по крайней мере, три (3) номера каналов или более от цели не допустить mdk3 от вмешательства с приемом softAPs "и не используйте один и тот же канал. Мы также предлагаем вам выбрать код макинтош для softAP очень близко к цели AP. Примечание в шестнадцатеричной 8 и B очень похожи, и есть другие. После softAP настроен, запустите тест с другого компьютера, и если все хорошо начать mdk3 -g нападение на цель. Клиенты не смогут подключиться к целевой AP и может поворачиваться и подключиться к softAP с таким же названием на другом канале. Вы также можете использовать десантный-нг вместо mdk3. С десантный-нг вы можете позволить некоторые клиенты получили доступ к в то время как другие запрета, который может действительно путают любой администратор пытается разобраться в проблеме. Когда клиенты подключаются к softAP и попытаться серфинга в сети, они представлены с уведомлением наймодателя их WPA ключ из-за коррупции их WPA кэша (см веб-страниц). Вам не нужно следить за нападение, как MySQL будет хранить ключ WPA для вас, которые могут быть просмотрены позднее. Успех атаки зависит от некоторых инженерных навыков социальных. Например, мы, как правило, начать атаку отключения AP случайно в течение времени, чтобы попытаться имитировать технические проблемы, прежде чем мы запустим программу фишинга.

    Для получения более подробной информации, мы советуем вам перейти в:

         http://www.youtube.com/watch?v=2upq7Ks3tBY

   Сама программа может быть запущена, нажав на kaliphish.sh и выберите Выполнить в окне терминала. Если программа не запускается, изменить разрешения для файла, чтобы быть выполнен в виде программы.Программа будет предлагать пользователю для различной информации, необходимой для принятия атаки функциональным. Однако до этой программе некоторые компоненты должны быть установлены !!!

Настройка kaliphish.sh

    Программа была протестирована на трех (3) компьютерах, работающих под управлением Кали и от HDD и USB упорной.

    Компьютеры были впервые обновляются с использованием следующих источников в  /etc/apt/sources.list

deb http://http.kali.org/kali kali main contrib non-free
deb-src http://http.kali.org/kali kali main contrib non-free
deb http://security.kali.org/kali-security kali/updates main contrib non-free
deb-src http://security.kali.org/kali-security kali/updates main contrib non-free
deb http://http.kali.org /kali main contrib non-free
deb http://http.kali.org /wheezy main contrib non-free

Мы предлагаем вам обновить компьютер с этом списке до продолжения

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

Click on the html file with your file manager and select display and see how the logo is positioned. Keep adjusting size till it looks good. Once you are satisfied with the pic then change the ⌠placelogohere■ to the ⌠filenameoflogo■ in all six(6) files found in the two(2) folders. Not placing a logo pic file name does not affect the running of this page. 

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

 
Ошибки и ограничения
1. Те, кто желает, чтобы переписать эту программу должны гарантировать, что авиабаза-нг командной строки использует -е НЕ --essid. Обратите внимание, что -e не даже перечислены в файле справки. Если --essid используется, проблемы наступит, если вы попробовать и использовать имя с пробелом, как Wi-Fi Hotspot и т.д. Существует вопрос, который мы думать Eterm но обойти это использовать -e.

2. Большинство проблем, возникающих при этом сценарий сделки с правами назначенным для веб-страниц. Перейти в файл свойств и позволяют эти файлы в качестве программы включают файл kaliphish.sh.

3. Вы должны иметь действительный подключение к интернету в противном случае программа не будет функционировать правильно. Просто общение к точке доступа не будет работать.

4. Программа Dnsmasq требует авиабаза-нг назначить интерфейс крана как At0. Если программа не удаляется и программа запускается второй раз, авиабаза-нг назначит крана интерфейс, АТ1 и программа не будет функционировать. Кроме того, если Dnsmasq работает, когда программа запускается второй раз, Dnsmasq не будет связываться с портом 53. При выполнении программы второго часового посмотрите, что авиабазы-нг страницы Eterm работает на водопроводной интерфейса At0. Вы также получите предупреждение привязки в сценарии, когда Dnsmasq работает, если порт 53 не является бесплатным.
   Мы считаем, что мы решили эту проблему с команд уничтожения в начале сценария. Но если проблемы остается вы можете либо перезапустить компьютер или использовать некоторые из инструментов отладки ниже.
  Некоторые инструменты отладки, если у вас есть проблемы работает

airmon-ng check
airmon-ng check kill
kill  #enter PID numbers remaining

Показать порт

NetStat -utlnp

Вы можете восстановить свой менеджер сети с помощью команды следующим образом:

Услуги начало сети менеджер

Или перезапустить:

Сеть обслуживания менеджер перезапуск


5. Мы не поставили ни одного подпрограммы обработки ошибок в скрипте.


В заключение мы хотели бы поблагодарить weaknet лаборатории за помощь в некоторых кодирования. И мы надеемся, что другие намного больше эксперта, то мы сами расширить этот подход.