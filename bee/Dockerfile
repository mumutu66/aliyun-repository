FROM centos:7

RUN yum install ImageMagick
RUN curl -O https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && rpm -Uvh epel-release*rpm && yum install GraphicsMagick
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install nodejs
RUN npm install -g pm2
RUN curl -O https://rpmfind.net/linux/RPM/centos/6.10/x86_64/Packages/libgcj-4.4.7-23.el6.x86_64.html
RUN rpm -hvi libgcj-4.4.7-23.el6.x86_64.rpm --nodeps
RUN curl -O https://www.linuxglobal.com/static/blog/pdftk-2.02-1.el7.x86_64.rpm
RUN rpm -hvi pdftk-2.02-1.el7.x86_64.rpm
