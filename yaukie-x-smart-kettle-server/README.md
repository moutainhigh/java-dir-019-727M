# Smart Kettle
 
## 引言 
    
    本产品是基于开源Kettle自研的Kettle核心接口调用基础组件，其实早在5年前就想搞了，构思了很久，拖到现在，不过还行，现在也不晚吧  
    最初的想法是启蒙于当年给烟草做过的一个数据交换平台的项目，数据的抽取是基于Kettle 5.x版本， 使用kettle的spoon客户端做的数据抽取  
    为企业解决了棘手并且重要的ETL问题，因此Kettle是一款非常优秀的开源数据抽取工具。  
    同时，kettle自身也有很多的问题，比如，
    - 只能使用客户端配置作业、转换
    - 跨平台移植困难
    - 数据安全性较差，系统一旦崩溃，文件库的内容容易丢失
    - 客户端非常耗内存、CPU，只适合配置，不适合做业务
    - Web界面极其简单、丑陋，生产环境无法投入使用
   
    基于上述几个企业痛点，我才决定工作之余，每天借用一点休息时间，慢慢积累，坚持不懈，才有了今天Smart Kettle调度平台的出世，也希望能切实  
    帮助到企业解决数据抽取、调度、监控的问题。
 
## 企业的痛点
- kettle的Spoon客户端太耗内存，异常卡顿，性能瓶颈明显
- kettle自带web管理工具，极其简陋，异常难用，无法投入生产环境
- kettle客户端工具无法在linux系统使用
- kettle客户端无法做到真正意义上的跨平台，bat及shell脚本切换繁杂
- kettle客户端迁移麻烦，每次都要安装一遍，耗费精力 

 ## 官方交流
 Smart Kettle 官方交流群①(500人)(已满)：668964239   
 Smart Kettle 官方交流群②(500人)：338594441 
 
 ## 联系我们
 联系邮箱： 869952837@qq.com
 联系邮箱： yaukie@163.com

## 简介
     Smart Kettle是针对上述企业的痛点，对kettle的使用做了一些包装、优化，使其在web端也能
     具备基础的kettle作业、转换的配置、调度、监控，能在很大一定程度上协助企业完成不同业务场景下
     数据的ETL（抽取、转换、加工）的能力。
     注意：本系统并非是对kettle源码的再造，而是借助kettle的API，实现kettle在web端功能华丽的转身
     
### 1. 它是一款超轻量级的kettle web端调度监控平台
- 支持作业、转换的自定义模板设置
- 支持作业、转换的多任务模板复制
- 支持作业、转换的GUI端配置同步到web端
- 支持作业、转换的日志自定路径配置
- 支持作业、转换的日志文件下载管理
- 支持文件库资源库配置
- 支持数据库资源库配置
- 支持SFTP/FTP/FTPS的远程资源库配置
- 支持资源库目录树查看
- 支持作业、转换的集群调度（远程子服务器调用）
- 支持作业、转换的GUI端配置同步到web端
- 支持作业、转换的调度配置
- 支持作业、转换的监控管理
- 支持作业、转换的本地执行
- 支持作业、转换的远程执行
- 支持作业、转换的定时配置
- 支持作业、转换的实时监控
- 支持kettle的web端资源库管理
- 支持自定义线程池设置、任务的并行处理
- 支持kettle 任务的告警监控、日志管理
- 提供丰富的业务库、字典库自定义设置
- 提供完整的、实时的大盘调度监控
- 提供系统的用户、角色、权限管理
- 提供Druid数据库查询脚本的实时监控能力
- 支持 Kettle 7.0.1+以上 版本
- 当前Kettle版本为9.2.0.0-179(注意：需要配置kettle-password-encoder-plugins，本系统已经集成进来，不需要再配置)

### 2. 它的平台实现充分基于"前后端分离"思想
- 后端架构基于 Springboot实现
- 服务端可发布 REST 服务
- 前端架构基于 VUE，数据组件更加丰富、易于维护
- 客户端通过 AJAX 获取服务端数据并进行界面渲染

### 3. 它的后端实现基于互联网最流行的微服务技术
- 后端架构采用自己搭建的x-common-base框架
- 后端封装了基于kettle的强大接口插件x-kettle-core
- 后端框架基于springboot+Mybatis实现
- 后端框架易于迁移、二次开发、方便维护

### 4. 它的前端实现基于互联网最流行的渐进式VUE框架

- 功能组件化，易于二次开发维护
- 新手容易上手，短时间内入门
- 界面更加美观、组件更加丰富
- 平台功能架构见如下图：  

![平台功能架构](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/struc.png)
 
## 技术方案
    技术栈:  
    - 前端使用nginx 作为前端服务器 
    - 前端使用vue作为展现框架
    - 数据库端使用mysql作为基础数据库
    - 数据库监控使用Druid作为基础监控
    - 定时调度使用Quartz作为基础插件
    - 后端框架使用Springboot+Mybatis作为组合 
    演示环境:  
      - 域名访问 :
          http://yuenbin.cn/test-kettle-admin
          用户名:superadmin或admin,密码为:1
      - ip访问:
          http://101.132.24.211/test-kettle-admin
          用户名:superadmin或admin 密码为:1
## 项目简介
整个工程的目录结构如下：  
后端工程：
- [内部网站：x-smart-kettle-server](https://gitee.com/yaukie/x-smart-kettle-server.git)
- [github.com：x-smart-kettle-server](http://github.com/yaukie/x-smart-kettle-server.git)
- [gitee.com：x-smart-kettle-server](https://gitee.com/yaukie/x-smart-kettle-server.git)

```
├─doc
│  └─database
│      ├─MySql_ds0  --基础数据库设置
│      └─MySql_ds1  --基础数据库设置
├─docker  --容器部署详情
├─folder
├─jenkins  --jenkins持续部署详情
├─settings  --maven默认配置
├─src
│  ├─main
│  │  ├─java
│  │  │  └─org
│  │  │      └─yaukie
│  │  │          └─frame
│  │  │              ├─autocode  --代码机入口
│  │  │              │  ├─controller
│  │  │              │  ├─dao
│  │  │              │  │  └─mapper
│  │  │              │  ├─model
│  │  │              │  └─service
│  │  │              │      ├─api
│  │  │              │      └─impl
│  │  │              ├─config  --系统基础配置入口
│  │  │              ├─kettle
│  │  │              │  ├─api  --kettle核心接口所在位置
│  │  │              │  ├─core
│  │  │              │  ├─listener   --kettle监听所在位置
│  │  │              │  ├─quartz   --定时器所在位置
│  │  │              │  └─service
│  │  │              ├─listener
│  │  │              └─pool   --线程池配置所在位置
│  │  └─resources   --核心配置所在位置
│  │      ├─mapper
│  │      ├─template
│  │      └─ui
│  │          └─images
│  └─test
│      └─java
│          └─org
│              └─yaukie
│                  └─frame   --核心逻辑所在位置
```   
前端工程：
- [内部网站：x-smart-kettle-front](http://open.inspur.com/yuenbin/x-smart-kettle-front.git)
- [github.com：x-smart-kettle-front](http://github.com/yaukie/x-smart-kettle-front.git)
- [gitee.com：x-smart-kettle-front](http://gitee.com/yaukie/x-smart-kettle-front.git)
```
├─docker
│  ├─dev
│  └─prod
├─jenkins
├─public
│  ├─cron
│  └─json
├─src
│  ├─api
│  │  ├─login-form
│  │  ├─main
│  │  │  └─components
│  │  │      ├─a-back-top
│  │  │      ├─error-store
│  │  │      ├─fullscreen
│  │  │      ├─header-bar
│  │  │      │  ├─custom-bread-crumb
│  │  │      │  └─sider-trigger
│  │  │      ├─language
│  │  │      ├─side-menu
│  │  │      ├─tags-nav
│  │  │      └─user
│  │  ├─page-box
│  │  │  └─src
│  │  │      └─styles
│  │  │          └─css
│  │  ├─page-table
│  │  │  └─src
│  │  │      ├─components
│  │  │      └─styles
│  │  │          └─css
│  │  ├─parent-view
│  │  ├─search-box
│  │  │  └─src
│  │  │      └─styles
│  │  │          └─css
│  │  ├─upload-file
│  │  │  └─src
│  │  │      └─styles
│  │  │          └─css
│  │  ├─upload-img
│  │  │  └─src
│  │  │      └─styles
│  │  │          ├─css
│  │  │          └─images
│  │  ├─upload-img-list
│  │  │  └─src
│  │  │      └─styles
│  │  │          └─css
│  │  ├─upload-video
│  │  │  └─src
│  │  │      └─styles
│  │  │          ├─css
│  │  │          └─images
│  │  └─weeks
│  │      └─src
│  ├─config
│  ├─directive
│  │  └─module
│  ├─libs --工具类
│  ├─locale --国际化配置
│  │  └─lang
│  ├─mock 
│  │  └─data
│  ├─router --基础路由配置
│  │  └─modules
│  ├─store --系统状态机
│  │  └─module
│  ├─styles
│  │  └─components
│  └─view --调度平台核心前端功能
│      ├─business --业务配置
│      ├─examples
│      │  ├─common
│      │  └─page
│      ├─exception --异常监控
│      ├─homepage --调度大屏
│      │  └─common
│      ├─job --作业调度
│      ├─log --日志监控
│      ├─login --登录模板
│      ├─pool  --线程池配置
│      ├─repo --资源库配置
│      ├─scheduler --定时器调度
│      ├─task --定时调度
│      ├─trans --转换调度
│      └─warning --告警监控

```
## 环境要求
- Maven3+
- Jdk1.8+
- Mysql5.7+

## 功能概览
- 登录界面  
![登录界面](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/login.png)  
登录界面内置了两个账号，一个是admin，一个是superadmin，密码1    
- 调度大盘  
![调度大盘](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/大屏_1.png)    
调度大盘上半部分，展示近期实例运行详情，包括运行成功、运行失败、运行中、以及未运行的实例总体概况  
![调度大盘](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/大屏_2.png)    
调度大盘中间部分，则通过图表统计作业以及转换实例的分类情况  
![调度大盘](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/大屏_3.png)    
调度大盘下半部分，则主要展示实例在某段时间的运行趋势如何，可以透过折线图很直观的看出每个时间段的
执行情况，包括运行失败、运行成功的次数分布 
调度大盘的最下面则主要统计任务告警情况  

- 作业调度 
![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/作业调度_1.png)
  调度管理分为作业调度以及转换调度，作业调度包括作业名称、描述、运行状态以及运行时间等信息展示 ，
  在作业调度查询界面，选择创建作业（按模板），则将会根据选定模板创建作业  
![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/作业调度_2.png)    
   在作业调度查询界面，选择新建作业（已有），则将会从资源库中选择已通过客户端配置好的  
     作业  
![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/作业调度_3.png)    
   在作业调度查询界面，选中目标作业之后，在上方点击合适的执行按钮，将会执行对应任务，并实时监控任务状态   
![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/作业调度_4.png)    
   在作业调度查询界面，选中目标作业之后，点击调度监控，则可以查看作业的调度图  
   上述所有操作，转换调度的操作方式同作业类似    

![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/作业调度_5.png)    

![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/作业调度_6.png)    

![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/作业调度_7.png)    

- 转换调度  
     转换调度查询列表,详细描述转换调度执行情况、执行历史、实时监控执行进度等功能  
![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/转换调度_1.png)    
     实时查看转换调度运行情况
  ![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/转换调度_2.png)    
     可随时编辑转换信息  
 ![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/转换调度_3.png)    
     可随时编辑转换信息  
![调度管理](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/转换调度_4.png)    
       
- 定时调度  
在作业调度界面，选中执行方式，在执行方式中，选择定时任务执行，则进入到定时执行调度界面  
![定时调度](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/定时调度_1.png)  
 在作业定时界面中，您可以选择任意的定时规则  
![定时调度](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/定时调度_1.png)    

-  资源库目录树
可以维护多个资源库，本系统同时支持文件库以及数据库资源库，但建议使用数据库作为资源库，文件库作为 
资源库使用过程中，经常会出现一些奇怪的问题，并且从数据备份角度来讲，不安全  
![资源库](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/资源库目录树.png)    

-  文件库资源库  
    支持文件库资源库的配置,可通过配置文件不同的传输类型,自定义远程服务器及本地服务的文件库配置,  
    如下图所示:  
![资源库](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/文件库_1.png)    
        
    SFTP/FTPS/FTP的配置情况如下图所示,可以通过配置远程机器,获取到远程的资源库目录信息  
![资源库](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/文件库_2.png)    

-  数据库资源库  
    支持数据库资源库配置,可通过配置数据库地址,连接资源库,此中方式更好的保护资源库信息,  
     使得后期业务更新、数据迁移、数据备份变得更加有效、也更加安全，如下图所示：  
![资源库](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/数据库资源库_1.png)    

- 告警监控   
告警监控主要采集作业任务或转换任务在某段时间内的执行细节，并将执行细节以异常记录的形式存储下来  
![告警监控](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/告警监控_1.png)     
便于后续任务调度过程中任务执行细节的跟踪，方便开发或运维人员精准找出任务异常原因    
![告警监控](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/告警监控_2.png)       

- 调度日志  
    支持作业/转换调度的日志检控管理,为业务场景提供全链条的日志跟踪机制,用户可以自由下载业务日志  
    通过实时监控日志调用情况,监控业务场景      
    ![告警监控](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/日志管理_1.png)       

- 登陆日志  

    支持不同用户登录日志监控,此举是为了监控用户登录/使用情况  
    ![告警监控](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/登录日志_1.png)     
      
    ![告警监控](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/登录日志_2.png)       

- 操作日志    
     支持用户操作行为监控,将系统关键节点操作行为记录下来,用作系统行为分析  
     
     ![告警监控](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/操作日志_1.png)       
     
    ![告警监控](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/操作日志_2.png)       
    
     
## 使用方式
   - 下载源码，自行搭建环境
   - 给你封装好插件，本地bat或shell脚本跑
   - 基于云端地址访问（需要购买阿里云或其他什么云服务器，要收费哦）  
   
### 1. 离线部署(源码访问)
- 下载 x-smart-kettle-server 后端应用 ，下载地址详见上述简介    
- 步骤一  
          将源码下载到本地，建议使用IDEA打开（Eclipse的没空研究，本人很久不再使用）,至于如何下载，如何导入至IDEA，
          作为一个专业的研发人员，这里不再赘述，直接进入到步骤二：  
 - 步骤二 
          配置一下maven的`setting.xml`，方便从本人的阿里云仓库下载相应的jar包，仓库地址配置为：
 ```
              <servers>
                  <server>
                      <id>rdc-releases</id>
                      <username>Y3z0VZ</username>
                      <password>Bb8byTSlq0</password>
                  </server>
                  <server>
                      <id>rdc-snapshots</id>
                      <username>Y3z0VZ</username>
                      <password>Bb8byTSlq0</password>
                  </server>
              </servers>
```
     ```
             <pluginRepository>
                              <id>snapshots</id>
                              <url>https://maven.aliyun.com/nexus/content/groups/public</url>
                              <releases>
                                  <enabled>false</enabled>
                              </releases>
                              <snapshots>
                                  <enabled>true</enabled>
                              </snapshots>
                          </pluginRepository>
                          <pluginRepository>
                              <id>rdc-releases</id>
                              <url>https://repo.rdc.aliyun.com/repository/128991-release-EJH8o1/</url>
                              <releases>
                                  <enabled>true</enabled>
                              </releases>
                              <snapshots>
                                  <enabled>false</enabled>
                              </snapshots>
                          </pluginRepository>
                          <pluginRepository>
                              <id>rdc-snapshots</id>
                              <url>https://repo.rdc.aliyun.com/repository/128991-snapshot-NY2Ub0/</url>
                              <releases>
                                  <enabled>false</enabled>
                              </releases>
                              <snapshots>
                                  <enabled>true</enabled>
                              </snapshots>
                          </pluginRepository>
                      </pluginRepositories>
                  </profile>
  ``` 
          内容不要更改，因为里面配置的是我本人的阿里云仓库地址，密码不会再改变，如果有变化，会在网站统一通知，届时，
          重新下载即可 ，仓库环境配置好之后，静静等待jar下载吧，等下载完毕，要去仓库检查一下是否有如下几个jar：  
```xml
          x1-simple-job-2021.4.jar
          x-kettle-core-2021.4.jar
          x-common-base-2021.5.jar
          x-common-pro-2021.5.jar
          x-common-auth-2021.5.jar
```
   如果本地仓库有如上几个jar，那么恭喜您，下载成功，接下来开始进入到步骤三：  
   如果本地无法拉取上述几个jar,那么请自行从本项目根目录/external/下面直接拿到对应jar,这里已经给各位读者打包好了对应jar  
   支持两个版本:  
   - kettle7.1  
   本文件夹中罗列的是kettle7.1版本的jar,理论上kettle的jar是向下兼容的, 如果要使用kettle7,请使用此目录中的kette-core.jar ,以及  
   对应的x-common-pro-2021.3.pom文件,该文件已经引入了kettle版本  
   - kettle9.2  
      本文件夹中罗列的是kettle9.2版本的jar,理论上kettle的jar是向下兼容的, 如果要使用kettle9,请使用此目录中的kette-core.jar ,以及  
      对应的x-common-pro-2021.5..pom文件,该文件已经引入了kettle版本    
      
      需要注意的是,因为是maven来管理jar包,因此,需要执行命令,将external文件夹下面的jar打到本地仓库,具体命令如下:  
      就拿x-kettle-core-2021.3.jar 为例说明:    
      ```
            mvn install:install-file     
            -Dfile=你的绝对路径目录/external/kettle7.1/x-kettle-core-2021.3.jar     
            -DgroupId=org.yaukie.xtl    (groupId 请查看pom文件)      
            -DartifactId=x-kettle-core    (artifactId 请查看pom文件)      
            -Dversion=2021.3   (version 请查看pom文件)      
            -Dpackaging=jar       
      ```

     其他的jar请自行打包到本地仓库  
     如果还不清楚,请加群咨询:  微型调度监控平台 668964239   
 - 步骤三  
        开始配置一下应用的yml文件，文件内容如下：  
 ```xml
 #配置服务器  
          #配置服务器
          #配置服务器
          server:
            port: ${XTL_APP_SERVER_PORT:9876}
            servlet:
              context-path: ${XTL_APP_SERVER_PATH:/xtl-server}
            #配置数据源
          spring:
            redis:
              # 默认不开启 则使用内置Map 作为缓存使用
              enabled: ${XTL_REDIS_ENABLED:false} # redis缓存开关【如果有redis建议开启,提高性能】
              host: ${XTL_REDIS_HOST:127.0.0.1}
              port: ${XTL_REDIS_PORT:6379}
              password: ${XTL_REDIS_PASS:root}
              jedis:
                pool:
                  max-active: 8
                  max-wait: -1
                  max-idle: 500
                  min-idle: 0
              lettuce:
                shutdown-timeout: 0
            application:
              name: ${XTL_APP_NAME:xtl-app} # 应用名称【使用默认就行】
            datasource:
              druid:
                # 主库数据源
                master:
                  #系统数据库访问地址【必填项】
                  url: ${XTL_APP_MASTER_DATASOURCE_URL:jdbc:mysql://localhost:3306/xtl?useUniCode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8}
                  #系统数据库用户名【必填项】
                  username: ${XTL_APP_MASTER_DATASOURCE_USERNAME:root}
                  #系统数据库密码【必填项】
                  password: ${XTL_APP_MASTER_DATASOURCE_PASS:root}
                # 从库数据源
                slave:
                  # 从数据源开关/默认关闭
                  enabled: false
                  url: jdbc:mysql://localhost:3306/test_01?useUniCode=true
                  username: root
                  password: root
              # 关闭sharding-jdbc 必须为false
            shardingsphere:
              enabled: false
          # 设置时区
            jackson:
              date-format: yyyy-MM-dd HH:mm:ss
              time-zone: GMT+8
          
          kettle:
            scheduler:
              #是否开启定时调度，默认为fals，则系统启动不会自动执行定时
              enabled: ${XTL_KETTLE_SCHEDULER:false}  #kettle定时调度启用为true,应用启动之后,自动将任务加入到定时器执行,设置为false则需要手动触发定时任务
            log:
              file:
                #日志物理路径【必填项】
                path: ${XTL_KETTLE_LOG_FILE_PATH:/xtl/kettle/logs} # 这个地方建议一定要配置一个存放目录,方便后期下载,查看历史执行记录,如果为"",则不会产生日志到服务器
                size: ${XTL_KETTLE_LOG_FILE_SIZE:10} # 控制日志文件的大小,默认是10M,超过10M则截断请求
            repo:
              # 自定义数据库资源库 使用之前必须先定义资源库【必填项】
              name: ${XTL_KETTLE_REPO_NAME:临时资源库} # 资源库名称【必填项】
              hostName: ${XTL_KETTLE_DB_HOST:localhost} # 数据库连接地址【必填项】
              dbPort: ${XTL_KETTLE_DB_PORT:3306} # 数据库端口 资源库目前仅支持MySQL【必填项】
              dbName: ${XTL_KETTLE_DB_NAME:etl} # 数据库实例名【必填项】
              userName: ${XTL_KETTLE_DB_USERNAME:root} #数据库用户名【必填项】
              passWord: ${XTL_KETTLE_DB_PASS:root} # 数据库密码【必填项】
              repoLoginName: ${XTL_KETTLE_REPO_LOGINNAME:admin} #资源库登录账户 默认admin【必填项】
              repoLoginPass: ${XTL_KETTLE_REPO_LOGINPASS:admin} #资源库登录密码 默认admin【必填项】
              # 该线程池会优先充满至最大的线程数（JDK默认优先将任务提交到队列，队列满了再充满至最大的线程数）
          
            pool:
              # 线程池前缀
              namePrefix: ${XTL_THREAD_POOL_PREFIX:kettleThreadPool}
              # 核心线程数
              coreThreads: ${XTL_THREAD_POOL_CORE:20}
              # 最大的线程数
              maxThreads: ${XTL_THREAD_POOL_MAX:50}
              # 队列容量
              queueCapacity: ${XTL_THREAD_POOL_QUEUE_CAPACITY:100}
              # 5分钟空闲则释放
              keepAliveTimeMin: ${XTL_THREAD_POOL_KEEPALIVE:5}
          
          # Swagger配置
          swagger:
            # 是否开启swagger
            enabled: true
            # 请求前缀
            pathMapping: /
            #当前系统版本号
            version: V2021.5
          
          # 系统验证配置
          yaukie:
            auth:
              enabled: true #  系统开启权限认证模块【使用默认就行】
              encoder:
                type: md5 # 使用MD5加密方式,如果不设置,则使用强散列函数【使用默认就行】
              # 是否开启权限认证模块
              # 如果开启登录验证模块,此配置有效
            token:
              # 令牌自定义标识
              header: Authorization # TOKEN 头【使用默认就行】
              # 令牌密钥
              secret: yuenbin@inspur.com&yaukie@163.com # TOKEN加密使用的秘钥【使用默认就行】
              # 令牌有效期（默认10分钟） 如果不配置 按照10分钟过期
              expire: 10 # 令牌TOKEN过期时间,默认十分钟【使用默认就行】
              # 令牌刷新间隔 1 分钟
              refresh: 1 # 零头TOKEN刷新间隔默认1分钟【使用默认就行】
          
          logging:
            #系统日志存放路径
            path: ${XTL_APP_LOG_PATH:/maven/xtl-web-server/logs}
            level:
              org.yaukie.frame.autocode.dao.mapper: debug
              root: ${XTL_APP_LOG_LEVEL:info}
              #扫描mapper配置,统一放到classpath目录下
          mybatis:
            mapper-locations: classpath*:mapper/**/*Mapper.xml
            configuration:
              log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
 ``` 
  配置注释写的很清楚了，这里不再解释，如有不懂的地方，请留言
        
 - 步骤四 
        步骤三完成之后，需要在本地建立一个应用数据库，数据库脚本详见：doc->database->Mysql，包括建表语句及初始化数据  
        请自行在本地执行，并完善yml配置 。
 - 步骤五 
        步骤四完成之后，开始配置kettle资源库数据库，虽然本系统同时支持文件库以及数据库资源库，但还是强烈建议使用数据库作为  
        资源库，考虑数据移植方便性、安全性、高效性，使用数据库作为资源库，资源库请自行建立，并完善yml配置。
 - 步骤六 
        上述步骤执行完毕之后，请将如下内容复制到`pom.xml` 文件中去，如果不加此文件，本地跑会有问题
     ```
             <resources>
                        <resource>
                            <directory>src/main/java</directory>
                            <includes>
                                <include>**/*.yml</include>
                                <include>**/*.xml</include>
                            </includes>
                            <filtering>false</filtering>
                        </resource>
                        <resource>
                            <directory>src/main/resources</directory>
                            <includes>
                                <include>**/*.yml</include>
                                <include>**/*.xml</include>
                            </includes>
                            <filtering>false</filtering>
                        </resource>
              </resources>
            
      ```
      如果要构建一键启动，重新打包，请按照如下方式修改`pom.xml` 文件,这种方式打成的jar包，不会包括xml以及kjb文件
     ```xml
               <resources>
                   <resource>
                       <directory>src/main/resources</directory>
                       <excludes>
                           <exclude>**/*.yml</exclude>
                           <exclude>**/*.kjb</exclude>
                       </excludes>
                       <filtering>true</filtering>
                   </resource>
               </resources>
    ```
     如上配置可以减少jar包的体积   
    需要注意的是：  
    1、由于本系统升级之后，支持Kettle 9.2.0.0-179版本，因此需要配置一下 `kettle-password-encoder-plugins.xml` 文件  
    本系统依赖包`x-kettle-core-2021.4.jar`已经集成了上述xml插件，因此，读者不需要再集成    
    2、直接使用Kettle 9.2.0.0-179版本，系统启动会报`[simple-jndi] is not directory` 异常，原因未知，为解决此问题，在根目录下面  
    建了一个`simple-jndi` 的目录，除非读者不使用9.2.0.0-179版本的Kettle，否则不要私自删除目录！  
    3、如果读者了解原因，也请留言，本人会及时更新升级  
 - 步骤七  
    资源库一定要设定好,按照配置文件给的信息,必须配一个资源库,默认为数据库类型的资源库,系统启动的时候需要加载、初始化,否则系统  
    跑不起来   
    请参考` application-dev.yml` 文件的资源库配置   
    重申一下:  
    默认的资源库名称为:xtl(名称可以随便更改),默认是数据库类型并且为Mysql,x_repository数据库中的默认repo_id为1326379690046259200   
    这个值是系统初始化的时候给定的,请不要更改!请不要更改!请不要更改!  
                
 - 步骤八 
        上述内容都配置好之后，这里运行：
        ```
            Start.java
        ```
        启动应用，并在浏览器访问：http://ip:port/xtl-server/swagger-ui.html ,出现如下截图，那么恭喜您启动成功：
        ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/start.png)
        
 - 步骤九         
   按照以上步骤一到步骤九，把项目后端跑起来之后，如何借助kettle GUI 把作业或转换通过smartKettle来执行、调度、监控呢，拿一个例子说明一下：
   比如有一个【旅游数据抽取】的转换任务，我现在要借助kettle去设计一下转换过程，然后通过smartkettle（前端运行方式，请自行查阅下文）将其管理监控起来。
  - 首先，要借助kettle客户端，设计一下这个转换任务，在windows界面双击spoon.bat，打开kettle GUI 界面 如下图所示：  
           ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_1.png)  
      
  - 第二步，连接资源库，如果没有资源库，自己新建一个，如何建资源库我这里就不再赘述了吧，如果不知道如何建，那建议你别使用smartkettle了，  
   这里我新建了一个叫【etl】的数据库资源库，如下图所示：  
              ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_2.png)  

   输入用户名admin，密码admin之后，点击登录，登录进kettle设计界面，如下图所示：  
     ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_4.png)  
   
   进入此界面，说明kettle资源库连接成功，然后，创建一个叫【旅游数据转换】的转换，如下图所示： 
     ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_5.png)  
   然后再创建一个，叫【旅游数据抽取】的作业，引入【旅游数据转换】，如下图所示： 
     ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_3.png)  
   
   将作业、转换保存到资源库中，登录smartkettle可以通过配置连接资源库，如下图所示：  
     ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_6.png)  
   
   配置一下资源库etl（本系统默认的就是etl），读者可根据自己实际情况，改成自己的etl连接地址  
   
- 第三步， 打开【调度管理-作业调度】菜单，如下图所示：  

点击【新建作业（已有）】，选择作业，打开如下图所示的资源库目录树，选择刚才通过kettleGUI新建的【旅游数据抽取】：  
  ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_9.png)  
点击确定，在作业查询列表中，就可以看到刚才选中的旅游数据抽取这条记录啦，这样，我们就可以通过smartkettle来管理、调度作业啦！
  ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_8.png)  
- 第四步，选中【旅游数据抽取】这个作业，点击如下图所示的本地运行按钮，点击确定，执行运行：
  ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_10.png)  

界面会弹出一个定时器规则没取到的预警，不用管他，这里支持两种运行方式，一种是立即运行，一种是定时运行，读者根据情况选择  
  ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_11.png)  

运行之后，回到刚才的作业调度查询界面，可以看到该作业调度正常运行起来了，如下图所示：
  ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_12.png)  

再次选择【旅游数据抽取】这条记录，点击【调度监控】，可以实时查看该调作业调度图及日志执行情况，如下图所示： 
  ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/k_13.png)   

利用kettle设计转换，然后通过smartkettle管理的方式、步骤，跟作业大相径庭，这里不再赘述：  

通过上述的步骤，给读者简单演示了一下，如何使用smartkettle，如何管理监控kettle设计的作业或转换  ，如果大家还有不明白的地方，请  
加入群聊 微型调度监控平台 668964239  
   
- 下载 x-smart-kettle-font 前端应用 ，下载地址详见上述简介   
     - 步骤一  
          Smart Kettle 调度监控平台的前端部署，需要依赖NodeJs环境，请自行百度搜素下载、安装，这里不再赘述  
   --安装NodeJs  
   --安装Vue脚手架  
   --配置node环境变量  
 ```
              # clone the project
                     git clone http://open.inspur.com/yuenbin/x-smart-kettle-front.git
                     git clone https://gitee.com/yaukie/x-smart-kettle-front.git
                     git clone http://github.com/yaukie/x-smart-kettle-front.git
                     // install dependencies
                     npm install
                     // develop
                     npm run dev
 ```
   - 步骤二
   配置一下`vue-config.js` ,把后端服务器的地址换成您的地址即可
```xml
  devServer: {
    proxy: {
      "/xtl-server": {
         target: "http://localhost:9876/xtl-server/",
        pathRewrite: { "^/xtl-server": "" },
        changeOrigin: true
     }
   }
  }
```
   然后执行 `npm run dev` 本地启动应用，出现如下控制台打印的信息，则恭喜您前端也启动成功！  
           ![启动截图](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/start2.png)
 
 
### 2. 在线部署(懒人模式)
    懒人模式使用方式针对那些不想下载源码，也不想自己搭建本地环境、下载依赖，说白了就是想通过傻瓜式的方式使用本系统。  
    那么，本人也为有这类需求的读者或企业提供了最省时省力的使用方式，详情请点击如下链接访问，查看具体使用教程：
    懒人教程请点击：  
    -> https://my.oschina.net/yaukie/blog/4993603
        
### 3. 云端部署(docker部署)--待完善
  本平台采用前后端分离,前后端都支持docker 远程镜像部署、拉取，支持云部署，读者可根据需要拉取镜像，完成本地化部署  
    - Smart Kettle 前端  
       前端镜像地址为：registry.cn-qingdao.aliyuncs.com/yaukie/kettle-admin:2021.4  
        --- 1. 登录服务器，执行如下docker命令，拉取Smart Kettle镜像， 
         docker pull registry.cn-qingdao.aliyuncs.com/yaukie/kettle-admin:2021.4  
   ![前端镜像](http://github.com/yaukie/x-smart-kettle-server/raw/master/folder/f_1.png)  
      出现上图的images,说明镜像拉取成功了  
    
   --- 2. 启动镜像文件  
     执行 docker images 命令,拿到对应的镜像ID  
   ![前端镜像](http://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/f_3.png)     
            然后执行如下命令,   
        docker run --name test-kettle-admin -p 80:80 -d d84b07291e84    
        执行上述命令之后,在系统上再执行 docker ps ,查看已经启动的容器信息  
      ![前端镜像](http://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/f_4.png)  
      出现上述的信息表示,系统启动成功!  
        然后直接在浏览器中,输入http://ip/test-kettle-admin 访问即可,如下图所示:
      ![前端镜像](http://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/f_5.png)    
          
  - Smart Kettle 后端  
        Smart Kettle 后端镜像拉取、部署方式跟前端类似，具体步骤不再赘述  
        需要执行的docker 拉取镜像的命令为：  
        docker pull registry.cn-qingdao.aliyuncs.com/yaukie/smart-kettle:2021.4  
        启动之后，在浏览器访问：http://ip/xtl-server/help/swagger  出现如下图:  
        ![前端镜像](http://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/h_2.png)    
        恭喜你,后端也执行成功!
        如果使用swagger执行接口,需要在请求头加上TOKEN验证 ,如下图所示:  
        ![前端镜像](http://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/h_3.png)    
         首先需要获取验证码,如下图所示:          
        ![前端镜像](http://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/h_4.png)    
         然后通过青丘/sso/login接口,将上述验证码作为参数,获取登录成功后的token,填入Authorization头 
         ![前端镜像](http://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/h_5.png)    

 ## 后续计划
       Smart Kettle 目前尚未完全实现Kettle web 端的编排，因此使用此系统还需要借助Kettle 客户端完成复杂作业及转换  
       的设计、测试，但提供了友好、优美、简洁的前端监控能力，kettle 组件的web端流程编排是以后本系统前进的方向，努力 
       实现的终极目标，也期待读者能持续关注升级、更新。  
   - 功能需求方面   
    1、后续考虑增加集群子服务器远程执行  
    2、后续考虑增加用户权限、角色权限设计  
    3、后续考虑增加线程池高级配置，支持多线程任务的灵活配置  
    4、后续研究Vue前端实现集成Kettle组件，实现Web端的Kettle任务流程编排  
   - 部署运维方面  
    1、考虑做到应用+服务+数据库一体化，jar包集成  
    2、考虑通过Docker容器方式实现功能移植   
    3、考虑通过Jenkins实现打包、部署   
    4、考虑发布到阿里云或其他什么云，远端访问  

## 相关模块

> 注意：模块不依赖于框架，可以独立使用。

- [x-common-base](http://github.com/yaukie/x-common-base) -- 基于Springboot自研的微服务架构
- [x-common-pro](http://github.com/yaukie/x-common-pro) -- 构建统一的jar包存放基础包
- [x-kettle-core](http://github.com/yaukie/x-kettle-core) -- 基于Kettle Api 打造的核心Kettle调用接口组件
- [x1-simple-job](http://github.com/yaukie/x1-simple-job) -- 基于Quartz的定时器调用插件
 
 ## 使用情况
当前该调度监控平台于2021年初正式上线，截止最新统计时间为止，Smart Kettle已接入的公司包括不限于：

     - 1、xx软件股份有限公司 http://xx.com.cn
     - 2、北京浪潮天元集团 https://lcjtgs.dyq.cn/
     - 3、南京竹石信息科技有限公司 http://www.mymedunion.com/
     - 4、陕西华海信息技术有限公司 http://www.sxhhit.com/
     - 5、野马集团有限公司 http://www.xjyema.com/
     - 6、山东微笑集成科技有限公司 http://www.weixiaoinfo.com/
                 
   > 更多接入的公司，欢迎在 [登记地址](https://gitee.com/yaukie/x-smart-kettle-server/issues/I39TQV) 登记，登记仅仅为了产品推广。 
 
## 参考资料

- Smart Kettle之后端介绍：https://my.oschina.net/yaukie/blog/4973081   
- Smart Kettle之新品推介：https://my.oschina.net/yaukie/blog/4969927   
- Vue 那点事儿：https://my.oschina.net/yaukie/blog/1547678  
- Docker 那点事儿：https://my.oschina.net/yaukie/blog/3165074  


## 捐赠
开源不易，感谢捐赠  
No matter how much the donation amount is enough to express your thought, thank you very much ：）   
  [To donate](https://my.oschina.net/yaukie/blog/4968854)
无论捐赠金额多少都足够表达您这份心意，非常感谢 ：）    
  [前往捐赠](https://my.oschina.net/yaukie/blog/4968854)  
  ## 作者简介
 @Author: yuenbin  
        屌丝一枚，码农搬运工，正努力成为互联网行业的土豪，多多益善，来者不拒！  
        佛祖保佑捐赠这些人写程序永无bug，工资翻倍，迎娶白富美，走上人生巅峰！  
       
![支付宝](https://gitee.com/yaukie/x-smart-kettle-server/raw/master/folder/wechat.jpg)  
       