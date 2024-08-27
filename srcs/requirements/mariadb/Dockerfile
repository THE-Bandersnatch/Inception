FROM debian:bookworm


RUN apt-get clean && apt-get update -m -y && apt-get install -y mariadb-server mariadb-client

COPY conf/script.sh /etc/script.sh

RUN chmod 777 /etc/script.sh && \
	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld

EXPOSE 3306

ENTRYPOINT ["bash" , "/etc/script.sh"]

CMD [ "mariadbd" , "--user=root" , "--bind-address=0.0.0.0" , "--port=3306" , "--verbose" ]