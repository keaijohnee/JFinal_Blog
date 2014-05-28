本程序是基于JFinal 1.5做的一个小站，代码没有使用什么特别的东西，用到了@JFinal作者提到的FakeStaticHandler来伪静态，其他的没什么。
小站刚开始使用Lucene来作为全文检索，后面又改成了SQL like匹配，估计要被广大人民喷了。。 后面有时间一定改成Lucene来实现全文检索和分词。

说明：
1、项目是基于MyEclipse8.5开发的，web容器使用的是tomcat，下载代码后直接导入MyEclipse即可以使用；
2、数据库在db文件加载，sql文件和psc文件均是Navicat导出的；
3、后台地址：http://ip:port/sysadmin 登录账号和密码均是admin;