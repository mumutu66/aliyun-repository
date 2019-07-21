FROM registry.cn-hangzhou.aliyuncs.com/xforceplus/superdb:1.0.0
RUN tar -xvsf nginx-1.16.0.tar.gz
RUN mkdir nginx-1.16.0/patch
RUN cd nginx-1.16.0/patch && wget https://raw.githubusercontent.com/chobits/ngx_http_proxy_connect_module/master/patch/proxy_connect_rewrite_101504.patch &&  git clone https://github.com/chobits/ngx_http_proxy_connect_module.git
WORKDIR nginx-1.16.0
RUN patch -p1 < patch/proxy_connect_rewrite_101504.patch
RUN ./configure --prefix=/opt/nginx --with-http_ssl_module --with-http_gzip_static_module --http-client-body-temp-path=/opt/nginx/tmp/client/ --http-proxy-temp-path=/opt/nginx/tmp/proxy/ --http-fastcgi-temp-path=/opt/nginx/tmp/fcgi/ --with-poll_module --with-file-aio --with-http_realip_module --with-http_addition_module --with-http_addition_module --with-http_random_index_module --with-http_stub_status_module --http-uwsgi-temp-path=/opt/nginx/uwsgi_temp --http-scgi-temp-path=/opt/nginx/scgi_temp --with-stream --with-stream_ssl_preread_module --without-http_rewrite_module --without-http_gzip_module
RUN mkdir -p /opt/nginx/tmp
RUN make && make install
RUN cp /opt/nginx/sbin/nginx /usr/sbin/nginx
ENTRYPOINT nginx -g 'daemon off;'