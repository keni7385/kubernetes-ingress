rm /var/log/nginx/access.log
rm /var/log/nginx/stream-access.log
rm /var/log/nginx/error.log

sed -i -e 's/access_log off/access_log on/g' /etc/nginx/nginx.conf

nginx -s reload
