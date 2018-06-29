FROM centos

RUN curl -sLf 'https://dl.cloudsmith.io/public/mjelen/mjelen/cfg/install/config.rpm.txt?os=el&dist=7' > /etc/yum.repos.d/mjelen-mjelen.repo

RUN yum update -y && yum install -y epel-release && yum install -y ruby && yum clean -y all && rm -rf /var/cache/yum

WORKDIR /root

COPY fix.rb /root

CMD /root/fix.rb