FROM ubuntu:18.04 

RUN apt-get update &&  apt-get -y install apache2

RUN echo 'Hello World!' > /var/www/html/index.html  

RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 sed '/Listen 80/ a  Listen 8081' /etc/apache2/ports.conf && \
 sed '/Listen 80/ a  Listen 3001' /etc/apache2/ports.conf && \
 cat /etc/apache2/ports.conf && \
 chmod 755 /root/run_apache.sh

EXPOSE 80 8081 3001

CMD /root/run_apache.sh
