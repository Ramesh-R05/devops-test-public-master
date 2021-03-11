FROM ubuntu:18.04 

RUN apt-get update &&  apt-get install apache2 -y

RUN apt-get install vim -y

RUN echo '<b> CCI-HELLO-WORLD ! How Are you Today... </b>' > /var/www/html/index.html  

RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \  
 chmod 755 /root/run_apache.sh 
 
EXPOSE 80

CMD /root/run_apache.sh

# END
