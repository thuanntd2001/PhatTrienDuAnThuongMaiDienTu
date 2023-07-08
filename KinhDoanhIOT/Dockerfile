# Sử dụng ảnh base tomcat:8.5
FROM tomcat:8.5-jdk8

# Sao chép tập tin WAR ứng dụng vào thư mục webapps của Tomcat
COPY target/dichvu-1.0.war /usr/local/tomcat



# Mở cổng 8080 để truy cập ứng dụng thông qua trình duyệt
EXPOSE 8080


CMD ["catalina.sh", "run"]
