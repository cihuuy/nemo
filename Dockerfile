FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 sudo bash net-tools novnc x11vnc xvfb supervisor xfce4 gnome-shell python3.8 python3-pip ubuntu-gnome-desktop gnome-session gdm3 tasksel ssh git nano curl wget zip unzip docker.io
RUN git clone https://github.com/ultrasecurity/Storm-Breaker && cd Storm-Breaker && sudo chmod +x linux-installer.sh && sudo bash linux-installer.sh && python3 -m pip install -r requirments.txt && sudo python3 Storm-Breaker.py



COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
