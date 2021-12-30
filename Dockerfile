FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 sudo bash net-tools novnc  x11vnc xvfb supervisor xfce4 gnome-shell ubuntu-gnome-desktop python3-pip gnome-session gdm3 tasksel ssh git nano curl wget zip unzip docker.io nodejs npm


RUN wget https://github.com/SaladTechnologies/salad-applications/releases/download/0.5.8/Salad-0.5.8_amd64.deb
RUN chmod 777 Salad-0.5.8_amd64.deb




COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
