# VERSION 1.0.0
# author: Jason Wang

FROM openjdk:17

#作者
MAINTAINER Jason Wang <jason.wang@vdx.com>

#系统编码
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
#path
ENV PATH /opt/conda/bin:$PATH



#把启动时用到的文件准备好
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN mkdir /nacos

ADD ./nacos /nacos

RUN chmod a+x /docker-entrypoint.sh

RUN chmod a+x /nacos -R

ENTRYPOINT ["sh","/docker-entrypoint.sh"]

EXPOSE 8848