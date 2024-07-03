FROM glassfish:4.1
WORKDIR /HelloWeb
COPY . .


ADD password_1.txt /tmp/password_1.txt
ADD password_2.txt /tmp/password_2.txt
RUN asadmin --user admin --passwordfile /tmp/password_1.txt change-admin-password --domain_name domain1 ; asadmin start-domain domain1 ; asadmin --user admin --passwordfile /tmp/password_2.txt enable-secure-admin ; asadmin stop-domain domain1
RUN rm /tmp/password_?.txt

ADD start-gf.sh /usr/local/bin/start-gf.sh