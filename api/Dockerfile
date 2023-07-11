# Sử dụng image mở rộng của Java 8
FROM openjdk:8-jdk-alpine

# Thêm các biến môi trường cho ứng dụng
ENV APP_HOME=/app
ENV APP_NAME=API-1.0
#ENV MYSQL_URL=jdbc:mysql://mysql:3306/mydb
#ENV MYSQL_USER=root
#ENV MYSQL_PASSWORD=password

# Tạo thư mục ứng dụng và sao chép các tệp vào đó
RUN mkdir $APP_HOME
COPY target/$APP_NAME.jar $APP_HOME

# Cài đặt MySQL client
#RUN apk update && \
 #   apk add mysql-client

# Thiết lập thư mục làm việc và cổng mặc định của ứng dụng
WORKDIR $APP_HOME
EXPOSE 8081 3306


# Chạy ứng dụng khi container được khởi động
CMD java -jar $APP_NAME.jar
