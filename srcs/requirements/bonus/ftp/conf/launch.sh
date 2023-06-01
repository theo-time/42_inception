# launch ftp server
service vsftpd start

# add ftp user and set password
# adduser ftpuser --disabled-password
# usermod --password $(echo $FTP_PASSWORD | openssl passwd -1 -stdin) ftpuser


# Create a directory for ftp
# mkdir /home/ftpuser/ftp

# Give ownership on it to ftpuser
chown ftpuser:ftpuser /home/ftpuser/ftp

# Set the directory as default home for ftpuser
usermod -d /home/ftpuser/ftp ftpuser

usermod -s /sbin/nologin ftpuser

echo "ftpuser" > /etc/vsftpd/userlist

# restart ftp server
service vsftpd stop

/usr/sbin/vsftpd