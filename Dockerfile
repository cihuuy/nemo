FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 sudo bash net-tools novnc firefox  x11vnc xvfb supervisor xfce4 gnome-shell python3.8 python3-pip ubuntu-gnome-desktop gnome-session gdm3 tasksel ssh git screenfetch nano curl wget zip unzip docker.io
RUN git clone https://github.com/cihuuy/QRLJacking && cd QRLJacking && cd QRLJacker && sudo chmod +x geckodriver && sudo mv -f geckodriver /usr/local/share/geckodriver && sudo ln -s /usr/local/share/geckodriver /usr/local/bin/geckodriver && sudo ln -s /usr/local/share/geckodriver /usr/bin/geckodriver && pip install -r requirements.txt



COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
