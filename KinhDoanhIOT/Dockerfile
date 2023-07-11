# Sử dụng ảnh base tomcat:8.5
FROM tomcat:8.5-jdk8

# Sao chép tập tin WAR ứng dụng vào thư mục webapps của Tomcat
COPY target/dichvu*.war /usr/local/tomcat/webapps/dichvu.war

COPY server.xml /usr/local/tomcat/conf/server.xml
# Mở cổng 8080 để truy cập ứng dụng thông qua trình duyệt
EXPOSE 8080


CMD ["catalina.sh", "run"]
