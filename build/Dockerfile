FROM nginx:1.15.10

# Enable only error logs on stderr, since access and stream-access are scraped by the nginx logger exporter
RUN ln -sf /proc/1/fd/2 /var/log/nginx/error.log 
#	&& ln -sf /proc/1/fd/1 /var/log/nginx/stream-access.log \
#	&& ln -sf /proc/1/fd/1 /var/log/nginx/access.log

COPY nginx-ingress internal/configs/version1/nginx.ingress.tmpl internal/configs/version1/nginx.tmpl /

COPY prometheus-nginxlog-exporter internal/configs/version2/prometheus-nginxlog-exporter-config.hcl /
RUN chmod +x prometheus-nginxlog-exporter

COPY internal/configs/version2/supervisord.conf /etc/supervisor/conf.d/

RUN rm /etc/nginx/conf.d/*

RUN mkdir -p /etc/nginx/secrets

RUN apt-get update && apt-get -y install supervisor # Installing supervisord for multiple entrypoints

# Uncomment the line below if you would like to add the default.pem to the image
# and use it as a certificate and key for the default server
# ADD default.pem /etc/nginx/secrets/default

ENTRYPOINT ["/usr/bin/supervisord"]
