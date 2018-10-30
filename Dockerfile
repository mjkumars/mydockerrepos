FROM ubuntu:12.04
# Install apache
RUN apt-get update -y
RUN apt-get install -y apache2

# Create a simple web page
RUN echo "This is a POC to clone source code with github from developer machine and build the docker container image using docker hub and hosting the docker container in AWS ECS. Test 1 " > /var/www/index.html

# Configure apache, set a few variables, expose port 80 and start apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
