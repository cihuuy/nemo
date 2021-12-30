FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 sudo bash net-tools novnc  x11vnc xvfb supervisor xfce4 gnome-shell ubuntu-gnome-desktop gnome-session gdm3 tasksel ssh git screenfetch nano curl wget zip unzip docker.io


RUN wget https://github.com/SaladTechnologies/salad-applications/releases/download/0.5.8/Salad-0.5.8_amd64.deb
RUN chmod 777 Salad-0.5.8_amd64.deb
RUN dpkg -i Salad-0.5.8_amd64.deb
RUN sudo apt install -f -y




COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
