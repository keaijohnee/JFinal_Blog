JFinal_Blog是基于JFinal1.5开源系统搭建的博客系统，以91zcm.com 网站作为模板和演示事例，目前已经加入了开源行列。

一、版本介绍：
1、版本V1.0：
本程序是基于JFinal 1.5做的一个小站，代码没有使用什么特别的东西，用到了@JFinal作者提到的FakeStaticHandler来伪静态，其他的没什么。小站刚开 始使用Lucene来作为全文检索，后面又改成了SQL like匹配，估计要被广大人民喷了。。 后面有时间一定改成Lucene来实现全文检索和分词。

2、版本V1.1：
1、将数据库连接池由C3P0升级为Druid实现；
2、废弃WEB-INF下的数据库连接配置，改用conf下的config.properties来实现配置；
3、将上一个版本留下的SQL模糊Like搜索功能修改为Lucene实现；
4、添加EhCache支持，对首页、列表、标签等叶面做数据缓存；
5、添加"91专题"栏目，将重点添加一些专题文章来提高搜索引擎的收录数量；
6、修复kindeditor上传图片、文件出现404错误的bug；
7、将MyEclipse中运行的启动类独立成com.zcm.starter.Starter.java方便启动。

二、开源说明：
1、小站模板是仿照百度搜索结果自己用table布局来写的顺便练习一下css；
2、部分页面（例如：首页）可以实现缓存，目前使用EHCache来作为缓存；
3、感谢@JFinal作者的开源精神，JFinal真的很不错，很简单，功能强大，方便开发者；
4、演示地址：http://www.91zcm.com/


使用说明：
1、项目是基于MyEclipse8.5开发的，web容器使用的是tomcat，下载代码后直接导入MyEclipse即可以使用；
2、数据库在db文件加载，sql文件和psc文件均是Navicat导出的；
3、后台地址：http://ip:port/sysadmin 登录账号和密码均是admin;
4、项目可以直接运行：CommonConfig.java 使用jetty启动。
