# jacocoReportTools  
## 环境  
- windows | linux | macos  
- java8  
- mysql5.7  
## 源码打包
### 前端  
PS.因为要装node-saas@4.14.0所以node.js需要14版本

1.进入frontend目录运行npm install 安装依赖

2.运行npm run build:prod编译前端代码  
### 服务端  
1.数据库连接地址配置，修改application-dev.properties文件的数据库地址  
2.修改application.properties文件中 gitToken和gitHost,gitToken需要能访问自己公司要申请jacoco报告的gitlab权限,需要在对应账号中获得token，要开通api权限gitHost中的localhost改成自己公司的gitlab的host  
3.使用maven打包项目,成功后会在target目录中生成XXX-1.1.0.tar.gz文件  
## 运行项目  
### 启动平台服务  
1.将XXX-1.1.0.tar.gz文件解压后，运行java -jar main.jar就可以启动项目了。

PS.如果需要用idea启动，则需要把前端编辑之后的frontend文件夹复制到static目录下
### jacocoagent配置  
1.将项目中的jacocoagent.jar推送到被测服务器目录下  
2.被测项目启动时添加以下参数  
 -javaagent:/服务器中的路径/jacocoagent.jar=serverhost=http://localhost:8083,projectname=skatoolsserver,uploadtime=1  

示例：
项目是zoe-admin-ctr
Jacoco = "-javaagent:/jacoco-agent/jacocoagent.jar=serverhost=http://168.12.53.156:8083,projectname=zoe-admin-ctr,uploadtime=5"
#### 参数说明  
1.serverhost：平台服务地址  
2.projectname：被测项目在gitlab中的路径，如：https://localhost/test/skatoolsserver  
3.uploadtime：上传exec文件间隔时间（分钟）
4.还可以添加其他的jacoco的参数，如include等，具体可以搜一下。      
## 前端配置页面
1.单模块项目，不需要配置子模块gitId  
2.多模块项目，如果要统计子模块覆盖率，需要配置对应子模块的gitId  
![image](https://user-images.githubusercontent.com/31475053/131991245-4be63b1a-09e6-41a8-9250-f2dc9d0acd93.png)  
![image](https://user-images.githubusercontent.com/31475053/131991473-0790381c-047b-464f-bb86-9f02603d8a36.png)  


## docker部署平台服务
dockerfire：
 ``` 
FROM 168.12.53.156/public/jdk:latest
ADD main.jar /main.jar
ADD static /static
ADD gitProject /gitProject
ADD maven /maven
ADD lib /lib

ENV M2_HOME=/maven
ENV PATH=$PATH:$M2_HOME/bin
ENV LC_ALL=zh_CN.UTF-8

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ 
    && yum -y install kde-l10n-Chinese telnet \ 
    && yum -y install glibc-common \ 
    && yum clean all \ 
    && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \ 
    && echo 'Asia/Shanghai' >/etc/timezone \ 
    && yum update -y \ 
    && yum install -y git \ 
    && source /etc/profile \
    && echo 'exec java -jar /main.jar' >> /start.sh && \ 
    chmod +x /start.sh
LABEL servername="jacocoServer"
ENTRYPOINT /start.sh
```

docker启动命令：

`docker run --name jacocoServer -itd -p 8083:8083 -v /soft/jacoco/gitProject:/gitProject -v /soft/jacoco/upload:/static/upload 168.12.53.156/zoe/jacocoserver:latest /bin/bash`