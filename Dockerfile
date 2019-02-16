FROM debian
RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get install wget \ 
    gnupg \
    libglib2.0-dev \
    libx11-dev \
    libgtk2.0-dev \
 	libcairo2-dev \    
    libpango1.0-dev \
    -y
RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
RUN apt-get install apt-transport-https -y
RUN echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
RUN apt-get update
RUN apt-get install sublime-text -y
RUN rm -rf /etc/services.d/avahi \
    /etc/services.d/dbus \
    /etc/cont-init.d/40-dbus-avahi
CMD subl