#基础镜像
FROM openjdk:8
#作者信息
MAINTAINER yuenbin "yaukie@163.com"
#解压压缩文件到容器指定目录
ADD smart-kettle-1.0.0-SNAPSHOT.jar /opt/smart-kettle.jar
#挂载容器日志目录到虚拟机上
# CentOS
RUN echo "Asia/shanghai" > /etc/timezone;
#设置环境变量
ENV JAVA_HOME /usr/java/jdk1.8.0_121 
ENV PATH $JAVA_HOME/bin:$PATH 
#容器启动时需要执行的命令
CMD ["java","-version"]
ENTRYPOINT ["java","-jar","-Xms500m","-Xmx1g","-XX:MaxDirectMemorySize=1g","-Dsun.net.client.defaultConnectTimeout=60000","-Dfile.encoding=UTF-8","/opt/smart-kettle.jar"]