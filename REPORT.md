terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ export GITHUB_USERNAME=prokopovichD
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ alias gsed=sed
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ cd ${GITHUB_USERNAME}/workspace
bash: cd: prokopovichD/workspace: Нет такого файла или каталога
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ cd
terry@terry-VirtualBox:~$ cd ${GITHUB_USERNAME}/workspace
terry@terry-VirtualBox:~/prokopovichD/workspace$ pushd .
~/prokopovichD/workspace ~/prokopovichD/workspace
terry@terry-VirtualBox:~/prokopovichD/workspace$ source scripts/activate
terry@terry-VirtualBox:~/prokopovichD/workspace$ git clone https://github.com/${GITHUB_USERNAME}/lab04 projects/lab05
fatal: целевой путь «projects/lab05» уже существует и не является пустым каталогом.
terry@terry-VirtualBox:~/prokopovichD/workspace$ cd projects/lab05
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ git remote remove origin
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ git remote add origin https://github.com/${GITHUB_USERNAME}/lab05
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ cmake -H. -B_build -DBUILD_TESTS=ON
CMake Deprecation Warning at third-party/gtest/CMakeLists.txt:1 (cmake_minimum_required):
  Compatibility with CMake < 2.8.12 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


CMake Deprecation Warning at third-party/gtest/googlemock/CMakeLists.txt:42 (cmake_minimum_required):
  Compatibility with CMake < 2.8.12 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


CMake Deprecation Warning at third-party/gtest/googletest/CMakeLists.txt:49 (cmake_minimum_required):
  Compatibility with CMake < 2.8.12 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


-- Configuring done
-- Generating done
-- Build files have been written to: /home/terry/prokopovichD/workspace/projects/lab05/_build
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ cmake --build _build
Consolidate compiler generated dependencies of target print
[ 16%] Built target print
Consolidate compiler generated dependencies of target gtest
[ 33%] Built target gtest
Consolidate compiler generated dependencies of target gtest_main
[ 50%] Built target gtest_main
Consolidate compiler generated dependencies of target check
[ 66%] Built target check
Consolidate compiler generated dependencies of target gmock
[ 83%] Built target gmock
Consolidate compiler generated dependencies of target gmock_main
[100%] Built target gmock_main
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ cmake --build _build --target test
Running tests...
Test project /home/terry/prokopovichD/workspace/projects/lab05/_build
    Start 1: check
1/1 Test #1: check ............................   Passed    0.00 sec

100% tests passed, 0 tests failed out of 1

Total Test time (real) =   0.01 sec
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ _build/check
Running main() from /home/terry/prokopovichD/workspace/projects/lab05/third-party/gtest/googletest/src/gtest_main.cc
[==========] Running 1 test from 1 test case.
[----------] Global test environment set-up.
[----------] 1 test from Print
[ RUN      ] Print.InFileStream
[       OK ] Print.InFileStream (0 ms)
[----------] 1 test from Print (0 ms total)

[----------] Global test environment tear-down
[==========] 1 test from 1 test case ran. (0 ms total)
[  PASSED  ] 1 test.
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ cmake --build _build --target test -- ARGS=--verbose
Running tests...
UpdateCTestConfiguration  from :/home/terry/prokopovichD/workspace/projects/lab05/_build/DartConfiguration.tcl
UpdateCTestConfiguration  from :/home/terry/prokopovichD/workspace/projects/lab05/_build/DartConfiguration.tcl
Test project /home/terry/prokopovichD/workspace/projects/lab05/_build
Constructing a list of tests
Done constructing a list of tests
Updating test list for fixtures
Added 0 tests to meet fixture requirements
Checking test dependency graph...
Checking test dependency graph end
test 1
    Start 1: check

1: Test command: /home/terry/prokopovichD/workspace/projects/lab05/_build/check
1: Test timeout computed to be: 10000000
1: Running main() from /home/terry/prokopovichD/workspace/projects/lab05/third-party/gtest/googletest/src/gtest_main.cc
1: [==========] Running 1 test from 1 test case.
1: [----------] Global test environment set-up.
1: [----------] 1 test from Print
1: [ RUN      ] Print.InFileStream
1: [       OK ] Print.InFileStream (0 ms)
1: [----------] 1 test from Print (0 ms total)
1: 
1: [----------] Global test environment tear-down
1: [==========] 1 test from 1 test case ran. (0 ms total)
1: [  PASSED  ] 1 test.
1/1 Test #1: check ............................   Passed    0.00 sec

100% tests passed, 0 tests failed out of 1

Total Test time (real) =   0.00 sec
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ gsed -i 's/lab04/lab05/g' README.md
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ gsed -i 's/\(DCMAKE_INSTALL_PREFIX=_install\)/\1 -DBUILD_TESTS=ON/' .travis.yml
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ gsed -i '/cmake --build _build --target install/a\
> - cmake --build _build --target test -- ARGS=--verbose
> ' .travis.yml
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ travis lint
Команда «travis» не найдена, но может быть установлена с помощью:
sudo snap install travis  # version 1.8.9, or
sudo apt  install travis  # version 210521-1
См. 'snap info travis', чтобы посмотреть дополнительные версии.
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ sudo snap install travis  # version 1.8.9
[sudo] пароль для terry: 
travis 1.8.9 from Travis CI✓ installed
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ mkdir artifacts
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ sleep 20s && gnome-screenshot --file artifacts/screenshot.png
Команда «gnome-screenshot» не найдена, но может быть установлена с помощью:
sudo apt install gnome-screenshot
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ open https://github.com/${GITHUB_USERNAME}/lab05
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ Gtk-Message: 19:20:17.707: Not loading module "atk-bridge": The functionality is provided by GTK natively. Please try to not load it.
sudo apt install gnome screenshot
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
E: Невозможно найти пакет screenshot
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ sudo apt install gnome-screenshot
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Следующие НОВЫЕ пакеты будут установлены:
  gnome-screenshot
Обновлено 0 пакетов, установлено 1 новых пакетов, для удаления отмечено 0 пакетов, и 202 пакетов не обновлено.
Необходимо скачать 46,0 kB архивов.
После данной операции объём занятого дискового пространства возрастёт на 262 kB.
Пол:1 http://ru.archive.ubuntu.com/ubuntu jammy/universe amd64 gnome-screenshot amd64 41.0-2 [46,0 kB]
Получено 46,0 kB за 0с (639 kB/s)           
Выбор ранее не выбранного пакета gnome-screenshot.
(Чтение базы данных … на данный момент установлено 198338 файлов и каталогов.)
Подготовка к распаковке …/gnome-screenshot_41.0-2_amd64.deb …
Распаковывается gnome-screenshot (41.0-2) …
Настраивается пакет gnome-screenshot (41.0-2) …
Обрабатываются триггеры для libglib2.0-0:amd64 (2.72.4-0ubuntu2.3) …
Обрабатываются триггеры для man-db (2.10.2-1) …
Обрабатываются триггеры для mailcap (3.70+nmu1ubuntu1) …
Обрабатываются триггеры для desktop-file-utils (0.26-1ubuntu3) …
Обрабатываются триггеры для hicolor-icon-theme (0.17-2) …
Обрабатываются триггеры для gnome-menus (3.36.0-1ubuntu3) …
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ sudo apt upgrade
Чтение списков пакетов… Готово
Построение дерева зависимостей… Готово
Чтение информации о состоянии… Готово         
Расчёт обновлений… Готово
Get more security updates through Ubuntu Pro with 'esm-apps' enabled:
  hub libnode72 nodejs nodejs-doc
Learn more about Ubuntu Pro at https://ubuntu.com/pro
Следующие пакеты будут обновлены:
  alsa-ucm-conf amd64-microcode apparmor bind9-dnsutils bind9-host bind9-libs bluez bluez-cups bluez-obexd bubblewrap ca-certificates cups cups-browsed cups-bsd cups-client cups-common cups-core-drivers cups-daemon
  cups-filters cups-filters-core-drivers cups-ipp-utils cups-ppdc cups-server-common dirmngr distro-info-data dmidecode dmsetup dns-root-data fonts-noto-color-emoji fonts-opensymbol ghostscript ghostscript-x
  gir1.2-gstreamer-1.0 gir1.2-harfbuzz-0.0 gir1.2-javascriptcoregtk-4.0 gir1.2-mutter-10 gir1.2-nm-1.0 gir1.2-packagekitglib-1.0 gir1.2-soup-2.4 gir1.2-webkit2-4.0 gjs gnome-control-center gnome-control-center-data
  gnome-control-center-faces gnome-shell gnome-shell-common gnome-shell-extension-ubuntu-dock gnupg gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client gpg-wks-server gpgconf gpgsm gpgv gstreamer1.0-alsa
  gstreamer1.0-gl gstreamer1.0-packagekit gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-good gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-x intel-microcode ipp-usb
  libabsl20210324 libapparmor1 libarchive13 libbluetooth3 libc-bin libcap2 libcap2-bin libcryptsetup12 libcups2 libcupsfilters1 libcupsimage2 libcurl3-gnutls libdebuginfod-common libdebuginfod1 libdevmapper1.02.1
  libdw1 libegl-mesa0 libelf1 libexpat1 libfontembed1 libfreetype6 libgbm1 libgd3 libgjs0g libgl1-mesa-dri libglapi-mesa libglib2.0-0 libglib2.0-bin libglib2.0-data libglx-mesa0 libgnutls30 libgs9 libgs9-common
  libgsf-1-114 libgsf-1-common libgssapi-krb5-2 libgstreamer-gl1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-0 libharfbuzz-icu0 libharfbuzz0b libjavascriptcoregtk-4.0-18
  libk5crypto3 libkrb5-3 libkrb5support0 libldap-2.5-0 libldap-common libmbim-glib4 libmbim-proxy libmm-glib0 libmpg123-0 libmutter-10-0 libnautilus-extension1a libnm0 libopenjp2-7 libpackagekit-glib2-18 libpam-cap
  libpam-modules libpam-modules-bin libpam-runtime libpam-sss libpam0g libpcap0.8 libperl5.34 libpoppler-cpp0v5 libpoppler-glib8 libpoppler118 libprotobuf23 libpython3.10 libpython3.10-minimal libpython3.10-stdlib
  libseccomp2 libsndfile1 libsnmp-base libsnmp40 libsoup-gnome2.4-1 libsoup2.4-1 libsoup2.4-common libsysmetrics1 libtasn1-6 libwebkit2gtk-4.0-37 libxatracker2 libyelp0 linux-base linux-firmware linux-tools-common
  mesa-vulkan-drivers modemmanager mutter-common nano nautilus nautilus-data network-manager network-manager-config-connectivity-ubuntu openssh-client openssl openvpn packagekit packagekit-tools pci.ids perl
  perl-base perl-modules-5.34 poppler-utils python3-pkg-resources python3-protobuf python3-urllib3 python3.10 python3.10-minimal rsync snapd tzdata ubuntu-advantage-desktop-daemon ubuntu-advantage-tools
  ubuntu-desktop ubuntu-desktop-minimal ubuntu-drivers-common ubuntu-minimal ubuntu-pro-client ubuntu-pro-client-l10n ubuntu-report ubuntu-standard wireless-regdb wpasupplicant xdg-desktop-portal xserver-common
  xserver-xephyr xserver-xorg-core xserver-xorg-legacy xwayland xxd yelp yelp-xsl
Обновлено 202 пакетов, установлено 0 новых пакетов, для удаления отмечено 0 пакетов, и 0 пакетов не обновлено.
132 standard LTS security updates
Необходимо скачать 416 MB/496 MB архивов.
После данной операции объём занятого дискового пространства возрастёт на 68,8 MB.
Хотите продолжить? [Д/н] y
Пол:1 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libperl5.34 amd64 5.34.0-3ubuntu1.4 [4 820 kB]
Пол:2 http://security.ubuntu.com/ubuntu jammy-security/main amd64 libabsl20210324 amd64 0~20210324.2-2ubuntu0.2 [386 kB]
Пол:3 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl amd64 5.34.0-3ubuntu1.4 [232 kB]
Пол:4 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-base amd64 5.34.0-3ubuntu1.4 [1 759 kB]
Пол:5 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-modules-5.34 all 5.34.0-3ubuntu1.4 [2 977 kB]
Игн:6 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc-bin amd64 2.35-0ubuntu3.9
Пол:7 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpam0g amd64 1.4.0-11ubuntu2.5 [59,8 kB]
Ошб:6 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libc-bin amd64 2.35-0ubuntu3.9
  404  Not Found [IP: 213.180.204.183 80]
Пол:8 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpam-modules-bin amd64 1.4.0-11ubuntu2.5 [37,4 kB]
Пол:9 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpam-modules amd64 1.4.0-11ubuntu2.5 [280 kB]
Пол:10 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libexpat1 amd64 2.4.7-1ubuntu0.6 [92,1 kB]
Пол:11 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10 amd64 3.10.12-1~22.04.9 [1 949 kB]
Игн:12 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-data all 2.72.4-0ubuntu2.4
Игн:13 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libk5crypto3 amd64 1.19.2-2ubuntu0.6
Игн:14 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libkrb5support0 amd64 1.19.2-2ubuntu0.6
Игн:15 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libkrb5-3 amd64 1.19.2-2ubuntu0.6
Игн:16 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgssapi-krb5-2 amd64 1.19.2-2ubuntu0.6
Ошб:17 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-2.5-0 amd64 2.5.18+dfsg-0ubuntu0.22.04.3
  404  Not Found [IP: 213.180.204.183 80]
Игн:18 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-bin amd64 2.72.4-0ubuntu2.4
Игн:19 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-0 amd64 2.72.4-0ubuntu2.4
Пол:20 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpam-runtime all 1.4.0-11ubuntu2.5 [40,2 kB]
Пол:21 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libseccomp2 amd64 2.5.3-2ubuntu3~22.04.1 [47,4 kB]
Пол:22 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 distro-info-data all 0.52ubuntu0.9 [5 336 B]
Пол:23 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libdevmapper1.02.1 amd64 2:1.02.175-2.1ubuntu5 [139 kB]
Пол:24 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dmsetup amd64 2:1.02.175-2.1ubuntu5 [81,7 kB]
Пол:25 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcryptsetup12 amd64 2:2.4.3-1ubuntu1.3 [211 kB]
Игн:26 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-pkg-resources all 59.6.0-1.2ubuntu0.22.04.2
Игн:27 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 tzdata all 2025b-0ubuntu0.22.04
Пол:28 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client-l10n amd64 35.1ubuntu0~22.04 [20,6 kB]
Пол:29 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client amd64 35.1ubuntu0~22.04 [236 kB]
Ошб:13 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libk5crypto3 amd64 1.19.2-2ubuntu0.6
  404  Not Found [IP: 213.180.204.183 80]
Пол:30 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-advantage-tools all 35.1ubuntu0~22.04 [10,9 kB]
Пол:31 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-minimal amd64 1.481.4 [2 928 B]
Пол:32 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gir1.2-mutter-10 amd64 42.9-0ubuntu9 [132 kB]
Пол:33 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 mutter-common all 42.9-0ubuntu9 [13,4 kB]
Пол:34 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 xserver-common all 2:21.1.4-2ubuntu1.7~22.04.14 [29,2 kB]
Пол:35 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 xserver-xorg-legacy amd64 2:21.1.4-2ubuntu1.7~22.04.14 [36,0 kB]
Пол:36 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 xserver-xorg-core amd64 2:21.1.4-2ubuntu1.7~22.04.14 [1 478 kB]
Ошб:14 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libkrb5support0 amd64 1.19.2-2ubuntu0.6
  404  Not Found [IP: 213.180.204.183 80]
Ошб:15 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libkrb5-3 amd64 1.19.2-2ubuntu0.6
  404  Not Found [IP: 213.180.204.183 80]
Ошб:16 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libgssapi-krb5-2 amd64 1.19.2-2ubuntu0.6
  404  Not Found [IP: 213.180.204.183 80]
Ошб:18 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-bin amd64 2.72.4-0ubuntu2.4
  404  Not Found [IP: 213.180.204.183 80]
Ошб:19 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-0 amd64 2.72.4-0ubuntu2.4
  404  Not Found [IP: 213.180.204.183 80]
Пол:37 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgl1-mesa-dri amd64 23.2.1-1ubuntu3.1~22.04.3 [8 860 kB]
Пол:38 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglx-mesa0 amd64 23.2.1-1ubuntu3.1~22.04.3 [158 kB]
Пол:39 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libegl-mesa0 amd64 23.2.1-1ubuntu3.1~22.04.3 [118 kB]
Пол:40 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglapi-mesa amd64 23.2.1-1ubuntu3.1~22.04.3 [35,4 kB]
Пол:41 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgbm1 amd64 23.2.1-1ubuntu3.1~22.04.3 [33,5 kB]
Пол:42 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libmutter-10-0 amd64 42.9-0ubuntu9 [1 380 kB]
Пол:43 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dmidecode amd64 3.3-3ubuntu0.2 [68,5 kB]
Пол:44 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpcap0.8 amd64 1.10.1-4ubuntu1.22.04.1 [145 kB]
Пол:45 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 pci.ids all 0.0~2022.01.22-1ubuntu0.1 [251 kB]
Пол:46 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-standard amd64 1.481.4 [2 948 B]
Пол:47 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 alsa-ucm-conf all 1.2.6.3-1ubuntu1.12 [43,5 kB]
Пол:48 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dns-root-data all 2024071801~ubuntu0.22.04.1 [6 132 B]
Пол:49 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 fonts-noto-color-emoji all 2.047-0ubuntu0.22.04.1 [10,0 MB]
Игн:50 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gir1.2-soup-2.4 amd64 2.74.2-3ubuntu0.4                                                                                                              
Игн:51 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsoup-gnome2.4-1 amd64 2.74.2-3ubuntu0.4                                                                                                           
Игн:52 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsoup2.4-common all 2.74.2-3ubuntu0.4                                                                                                              
Игн:53 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsoup2.4-1 amd64 2.74.2-3ubuntu0.4                                                                                                                 
Пол:54 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libmm-glib0 amd64 1.20.0-1~ubuntu22.04.4 [262 kB]                                                                                                    
Пол:55 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 network-manager amd64 1.36.6-0ubuntu2.1 [2 202 kB]                                                                                                   
Ошб:50 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 gir1.2-soup-2.4 amd64 2.74.2-3ubuntu0.4                                                                                                                
  404  Not Found [IP: 213.180.204.183 80]
Ошб:51 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libsoup-gnome2.4-1 amd64 2.74.2-3ubuntu0.4                                                                                                             
  404  Not Found [IP: 213.180.204.183 80]
Ошб:53 http://security.ubuntu.com/ubuntu jammy-updates/main amd64 libsoup2.4-1 amd64 2.74.2-3ubuntu0.4                                                                                                                   
  404  Not Found [IP: 213.180.204.183 80]
Пол:56 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnm0 amd64 1.36.6-0ubuntu2.1 [456 kB]                                                                                                              
Пол:57 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gir1.2-nm-1.0 amd64 1.36.6-0ubuntu2.1 [84,1 kB]                                                                                                      
Пол:58 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpackagekit-glib2-18 amd64 1.2.5-2ubuntu3 [124 kB]                                                                                                 
Пол:59 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gir1.2-packagekitglib-1.0 amd64 1.2.5-2ubuntu3 [25,3 kB]                                                                                             
Пол:60 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnome-control-center-data all 1:41.7-0ubuntu0.22.04.9 [343 kB]                                                                                       
Пол:61 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnome-control-center amd64 1:41.7-0ubuntu0.22.04.9 [1 785 kB]                                                                                        
Пол:62 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnome-control-center-faces all 1:41.7-0ubuntu0.22.04.9 [1 218 kB]                                                                                    
Пол:63 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gjs amd64 1.72.4-0ubuntu0.22.04.4 [106 kB]                                                                                                           
Пол:64 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgjs0g amd64 1.72.4-0ubuntu0.22.04.4 [402 kB]                                                                                                      
Пол:65 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnome-shell amd64 42.9-0ubuntu2.3 [877 kB]                                                                                                           
Пол:66 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnome-shell-common all 42.9-0ubuntu2.3 [183 kB]                                                                                                      
Пол:67 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnome-shell-extension-ubuntu-dock all 72~ubuntu5.22.04.3 [95,0 kB]                                                                                   
Пол:68 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 packagekit-tools amd64 1.2.5-2ubuntu3 [28,8 kB]                                                                                                      
Пол:69 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gstreamer1.0-packagekit amd64 1.2.5-2ubuntu3 [9 064 B]                                                                                               
Пол:70 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 packagekit amd64 1.2.5-2ubuntu3 [442 kB]                                                                                                             
Игн:71 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-common all 2.5.18+dfsg-0ubuntu0.22.04.3                                                                                                      
Пол:72 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libmbim-proxy amd64 1.28.0-1~ubuntu20.04.2 [6 160 B]                                                                                                 
Пол:73 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libmbim-glib4 amd64 1.28.0-1~ubuntu20.04.2 [192 kB]                                                                                                  
Пол:74 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 nautilus amd64 1:42.6-0ubuntu2 [632 kB]                                                                                                              
Пол:75 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 nautilus-data all 1:42.6-0ubuntu2 [11,4 kB]                                                                                                          
Пол:76 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnautilus-extension1a amd64 1:42.6-0ubuntu2 [16,2 kB]                                                                                              
Пол:77 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsnmp-base all 5.9.1+dfsg-1ubuntu2.8 [201 kB]                                                                                                      
Пол:78 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsnmp40 amd64 5.9.1+dfsg-1ubuntu2.8 [1 070 kB]                                                                                                     
Пол:79 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxatracker2 amd64 23.2.1-1ubuntu3.1~22.04.3 [2 113 kB]                                                                                             
Пол:80 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-base all 4.5ubuntu9+22.04.1 [19,1 kB]                                                                                                          
Игн:81 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-firmware all 20220329.git681281e4-0ubuntu3.36                                                                                                  
Пол:82 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 mesa-vulkan-drivers amd64 23.2.1-1ubuntu3.1~22.04.3 [10,7 MB]                                                                                        
Пол:83 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 modemmanager amd64 1.20.0-1~ubuntu22.04.4 [1 094 kB]                                                                                                 
Пол:84 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 network-manager-config-connectivity-ubuntu all 1.36.6-0ubuntu2.1 [2 238 B]                                                                           
Пол:85 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 openvpn amd64 2.5.11-0ubuntu0.22.04.1 [619 kB]                                                                                                       
Пол:86 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 snapd amd64 2.67.1+22.04 [27,8 MB]                                                                                                                   
Пол:87 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-desktop-minimal amd64 1.481.4 [3 804 B]                                                                                                       
Пол:88 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-desktop amd64 1.481.4 [2 594 B]                                                                                                               
Игн:89 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 wireless-regdb all 2024.07.04-0ubuntu1~22.04.1                                                                                                       
Пол:90 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 xdg-desktop-portal amd64 1.14.4-1ubuntu2~22.04.2 [265 kB]                                                                                            
Пол:91 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 xserver-xephyr amd64 2:21.1.4-2ubuntu1.7~22.04.14 [1 014 kB]                                                                                         
Пол:92 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 xwayland amd64 2:22.1.1-1ubuntu0.18 [935 kB]                                                                                                         
Игн:93 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 intel-microcode amd64 3.20250211.0ubuntu0.22.04.1                                                                                                    
Пол:94 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpam-sss amd64 2.6.3-1ubuntu3.5 [40,9 kB]                                                                                                          
Игн:12 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-data all 2.72.4-0ubuntu2.4                                                                                                                
Игн:26 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-pkg-resources all 59.6.0-1.2ubuntu0.22.04.2                                                                                                  
Игн:27 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 tzdata all 2025b-0ubuntu0.22.04                                                                                                                      
Игн:52 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsoup2.4-common all 2.74.2-3ubuntu0.4                                                                                                              
Ошб:71 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libldap-common all 2.5.18+dfsg-0ubuntu0.22.04.3                                                                                                      
  404  Not Found [IP: 213.180.204.183 80]
Игн:81 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-firmware all 20220329.git681281e4-0ubuntu3.36                                                                                                  
Игн:89 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 wireless-regdb all 2024.07.04-0ubuntu1~22.04.1                                                                                                       
46% [Ожидание заголовков]                                                                                                                                                             6 342 kB/s 51с^Zs 51с
[1]+  Остановлен    sudo apt upgrade
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ sleep 20s && gnome-screenshot --file artifacts/screenshot.png
terry@terry-VirtualBox:~/prokopovichD/workspace/projects/lab05$ sleep 20s && gnome-screenshot --file artifacts/screenshot.png

