FROM ubuntu:18.04 

RUN apt-get update &&  apt-get -y install apache2

RUN echo '<b> Hello World ! </b>' > /var/www/html/index.html  

RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 sed '/Listen 80/ a  Listen 8090' /etc/apache2/ports.conf && \ 
 cat /etc/apache2/ports.conf && \
 chmod 755 /root/run_apache.sh

EXPOSE 8090

CMD /root/run_apache.sh
