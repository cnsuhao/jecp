JECP
使用的框架为：JFinal+activite+spring+mybaties
UI框架：Kindedit+easyui
数据库设计插件:ERMaster
数据库:mysql

数据库脚本在/doc/数据库/easyjfoa.sql

一、软件部署
 1)环境准备：
    tomcat6.0以上，数据库mysql
 2)修改数据库配置文件，文件是在/confing/config.properties文件中修改。
 3)运行easyjfoa.sql脚本。
 4)tomcat部署项目。说明，此有多种配置方式。具体请依据个人智商而定。
 二、运行
  浏览器打开http://IP:端口/path名称/
  默认密码为123456。密码采用md5加密。