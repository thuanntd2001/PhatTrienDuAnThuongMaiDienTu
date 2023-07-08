FROM mysql:latest

# Đặt mật khẩu cho người dùng root và tên người dùng/mật khẩu cho người dùng khác
ENV MYSQL_ROOT_PASSWORD password

# Tạo thư mục trống để lưu trữ tệp SQL
RUN mkdir -p /docker-entrypoint-initdb.d

# Sao chép tệp SQL từ máy tính của bạn vào container
COPY chinhsuacuoi2.sql /docker-entrypoint-initdb.d/

# Khởi động máy chủ MySQL và nạp tệp SQL
CMD ["mysqld", "--init-file=/docker-entrypoint-initdb.d/chinhsuacuoi.sql"]

