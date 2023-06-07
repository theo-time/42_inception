# launch ftp server
service vsftpd start


# add ftp user and set password
# adduser ftpuser --disabled-password
# adduser --gecos "" --disabled-password ftpuser
# # chpasswd <<"ftpuser:$password"
# echo "ftp_user:$FTP_PASSWORD" | /usr/sbin/chpasswd

# METHOD 1
useradd -ms /bin/bash -p "$(openssl passwd -1 $FTP_PASSWORD)" ftpuser

# METHOD 2
# adduser ftpuser --disabled-password
# echo "ftpuser:$FTP_PASSWORD" | /usr/sbin/chpasswd

# usermod --password $(echo $FTP_PASSWORD | openssl passwd -1 -stdin) ftpuser
# echo "ftp_user:$FTP_PASSWORD" | /usr/sbin/chpasswd

# Add user to ftp users list
echo "ftpuser" >> /etc/vsftpd.userlist

# # Create a directory for ftp
# mkdir /home/ftpuser/ftp

# chown nobody:nogroup /home/ftpuser/ftp
# chmod a-w /home/ftpuser/ftp

# mkdir /home/ftpuser/ftp/files
# chown ftpuser:ftpuser /home/ftpuser/ftp/files

mkdir -p /var/www/html

# # # Give ownership on it to ftpuser
chmod a-w /var/www/html
chown -R ftpuser:ftpuser /var/www/html

# # # Set the directory as default home for ftpuser
# usermod -d /var/www/html/wordpress ftpuser

# usermod -s /sbin/nologin ftpuser


# sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
# sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf


# echo "
# local_enable=YES
# allow_writeable_chroot=YES
# pasv_enable=YES
# local_root=/var/www/html
# pasv_min_port=40000
# pasv_max_port=40005
# userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

# # restart ftp server
service vsftpd stop

/usr/sbin/vsftpd 