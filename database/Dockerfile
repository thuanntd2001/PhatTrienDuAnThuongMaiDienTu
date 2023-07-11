FROM mysql:latest

# Đặt mật khẩu cho người dùng root và tên người dùng/mật khẩu cho người dùng khác
ENV MYSQL_ROOT_PASSWORD password

# Sao chép tệp SQL từ máy tính của bạn vào container
COPY chinhsuacuoi2.sql /docker-entrypoint-initdb.d/


