## 博客介绍

<p align=center>
  <a href="http://www.shiyit.com">
    <img src="https://portrait.gitee.com/uploads/avatars/user/1802/5407895_quequnlong_1646130774.png!avatar200" alt="拾壹博客" style="border-radius: 50%">
  </a>
</p>

<p align="center">
   <a target="_blank" href="https://github.com/X1192176811/blog">
      <img src="https://img.shields.io/hexpm/l/plug.svg"/>
      <img src="https://img.shields.io/badge/JDK-1.8+-green.svg"/>
      <img src="https://img.shields.io/badge/springboot-2.4.1.RELEASE-green"/>
      <img src="https://img.shields.io/badge/vue-2.5.17-green"/>
      <img src="https://img.shields.io/badge/mysql-5.5.0-green"/>
      <img src="https://img.shields.io/badge/mybatis--plus-3.4.0-green"/>
      <img src="https://img.shields.io/badge/redis-6.0.5-green"/>
      <img src="https://img.shields.io/badge/elasticsearch-7.9.2-green"/>
   </a>
</p>

[在线地址](#在线地址) | [目录结构](#目录结构) | [项目特点](#项目特点) | [技术介绍](#技术介绍) | [运行环境](#运行环境)

英文文档:[English document](./README-EN.md)

## 寻找一个前端和后端来维护本项目
- 说明
>因工作原因，一直无法来修改和优化一些bug，然后也看到有很多伙伴都喜欢这个项目关注这个项目，所以寻找一个前端和后端来维护本项目，以及解决部分bug，如有觉得好玩实用的功能也可以开发。

- 要求
>- 前端：vue、elmentui 
>- 后端：springboot、springcloud

- 注意事项
>- 需要知道的是前端问题我帮不上很多忙，主后端。
>- 无偿，你有空就可以来优化项目，

## 在线地址

**项目链接：** [拾壹博客](http://www.shiyit.com)

**后台链接：** [拾壹博客后台管理系统](http://www.shiyit.com/admin)

账号:test 密码:123456

**Gitee地址：** [https  ://gitee.com/quequnlong/shiyi-blog](https://gitee.com/quequnlong/shiyi-blog)

您的star是我坚持的动力，感谢大家的支持，欢迎提交pr共同改进项目。

## 目录结构

前端项目blog-web为前台，blog-admin为后台。

后端项目位于blog下。

SQL文件位于根目录下的shiyi-blog.sql

可直接导入该项目于本地，修改后端配置文件中的数据库等连接信息，项目中使用到的关于七牛云功能和第三方授权登录等需要自行开通。

当你克隆项目到本地后可使用账号：admin，密码：123456 进行登录

本地访问接口文档地址：http://127.0.0.1:8800/shiyi/doc.html

**ps：请先运行后端项目，再启动前端项目，前端项目配置由后端动态加载。** 

```
blog
├── annotation    --  自定义注解
├── aspect        --  aop模块
├── config        --  配置模块
├── common        --  常量模块
├── controller    --  控制器模块
├── entity        --  实体类模块
├── dto           --  dto模块
├── enums         --  枚举模块
├── exception     --  自定义异常模块
├── mapper        --  框架核心模块
├── service       --  服务模块
├── strategy      --  策略模块（用于扩展第三方登录，搜索模式，上传文件模式等策略）
├── utils         --  工具类模块
├── quartz        --  定时功能模块
├── webmagic      --  文章爬虫模块
└── vo            --  vo模块
```
## 项目特点

- 后台参考"vue-element-template"设计，侧边栏，历史标签，面包屑自动生成。
- 采用Markdown编辑器，写法简单。
- 评论支持表情输入回复等
- 添加音乐播放器，支持在线搜索歌曲。
- 前后端分离部署，适应当前潮流。
- 接入第三方登录，减少注册成本。
- 留言采用弹幕墙，更加炫酷。
- 支持代码高亮和复制，图片预览，深色模式等功能，提升用户体验。
- 搜索文章支持高亮分词，响应速度快。
- 新增文章目录、推荐文章等功能，优化用户体验。
- 新增aop注解实现日志管理
- 支持动态权限修改，采用RBAC模型，前端菜单和后台权限实时更新。
- 后台管理支持修改背景图片，博客配置等信息，操作简单，支持上传相册。
- 代码支持多种搜索模式（Elasticsearch或MYSQL），可支持配置。
- 代码支持多种文件上传模式（七牛云oss或本地上传），可支持配置。
- 代码遵循阿里巴巴开发规范，利于开发者学习。
- 使用websocket技术实现博客在线阅读人数。

## 技术介绍

**前端：** vue + vuex + vue-router + axios + vuetify + element + echarts

**后端：** SpringBoot + nginx + docker + sa-token + Swagger2 + MyBatisPlus + Mysql + Redis + elasticsearch 

**其他：** 接入QQ、微博、码云第三方登录，接入七牛云对象存储

## 运行环境

**服务器：** 腾讯云2核4G CentOS7.6

**对象存储：** 七牛云OSS

**最低配置：** 1核2G服务器（关闭ElasticSearch）

## 开发环境

|            开发工具            |           说明            |
| ----------------------------- | ------------------------- |
| IDEA                          | Java开发工具IDE            |
| VSCode                        | Vue开发工具IDE             |
| Navicat                       | MySQL远程连接工具          |
| Another Redis Desktop Manager | Redis远程连接工具          |
| finalshell                    | Linux远程连接和文件上传工具 |

|    开发环境    |  版本  |
| ------------- | ----- |
| JDK           | 1.8   |
| MySQL         | 5.5.0 |
| Redis         | 6.0.5 |
| Elasticsearch | 7.9.2 |