FROM  registry.cn-hangzhou.aliyuncs.com/acs/aliyun-ingress-controller:0.15.0-3
RUN rm /usr/lib/liblua.so
COPY build.sh build.sh
COPY boost_1_65_1_rc2.tar.gz /root/.hunter/_Base/Download/Boost/1.65.1/4a5b0c3/boost_1_65_1.tar.bz2
RUN chmod +x build.sh
RUN ./build.sh
