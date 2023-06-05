# README-EN
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

[OnlineAddress](#在线地址) | [DirectoryStructure](#目录结构) | [ProjectFeatures](#项目特点) |[TechnologyIntroduction](#技术介绍) | [OperatingEnvironment](#运行环境)

Chinese document:[Chinese document](./README.md)

## 在线地址

**project link：** [http://www.shiyit.com](http://www.shiyit.com)

**Background link：** [http://www.shiyit.com/admin](http://www.shiyit.com/admin)

Account: test Password: 123456

**Gitee address：** [https  ://gitee.com/quequnlong/shiyi-blog](https://gitee.com/quequnlong/shiyi-blog)

Your star is the driving force for me to persevere. Thank you for your support. Welcome to submit pr to improve the project together.

## 目录结构

The front-end project blog-web is the foreground, and blog-admin is the background.

The backend project is located under the blog.

The SQL file is located at shiyi-blog.sql in the root directory

You can directly import the project locally, and modify the connection information such as the database in the back-end configuration file. The Qiniu cloud function and third-party authorized login used in the project need to be activated by yourself.

When you clone the project to the local, you can use the account: admin, password: 123456 to log in

Local access interface document address: http://127.0.0.1:8800/shiyi/doc.html

ps: Please run the back-end project first, and then start the front-end project. The front-end project configuration is dynamically loaded by the back-end.

```
blog
├── annotation    --  custom annotation
├── aspect        --  aop module
├── config        --  config module
├── common        --  constant module
├── controller    --  controller module
├── entity        --  entity class module
├── dto           --  dto module
├── enums         --  enum module
├── exception     --  custom exception module
├── mapper        --  framework core module
├── service       --  service module
├── strategy      --  Policy module (used to extend third-party login, search mode, upload file mode and other policies)
├── utils         --  utils module
├── quartz        --  Timing function module
├── webmagic      --  Article crawler module
└── vo            --  vo module
```

## 项目特点

- The background refers to the "vue-element-template" design, the sidebar, the history tab, and the breadcrumbs are automatically - generated.
- Using the Markdown editor, the writing method is simple.
- Comments support expression input reply, etc.
- Add music player to support online search for songs.
- The front and back ends are deployed separately to adapt to the current trend.
- Access to third-party login to reduce registration costs.
- The message adopts the bullet curtain wall, which is more cool.
- Support code highlighting and copying, image preview, dark mode and other functions to improve user experience.
- Search articles support word segmentation, and the response speed is fast.
- Added article catalog, recommended articles and other functions to optimize user experience.
- Add aop annotation to realize log management
- Support dynamic permission modification, adopt RBAC model, front-end menu and background permissions are updated in real time.
- Background management supports modifying background pictures, blog configuration and other information, easy to operate, and - supports uploading photo albums.
- The code supports multiple search modes (Elasticsearch or MYSQL) and supports configuration.
- The code supports multiple file upload modes (Qiniuyun oss or local upload) and supports configuration.
- The code follows Alibaba's development specifications, which is beneficial for developers to learn.
- Use websocket technology to realize the number of online readers of blogs.

## 技术介绍
Front end: vue + vuex + vue-router + axios + vuetify + element + echarts

Backend: SpringBoot + nginx + docker + sa-token + Swagger2 + MyBatisPlus + Mysql + Redis + elasticsearch

Others: Access to QQ, Weibo, Code cloud third-party login, access to Qiniu cloud object storage

## 运行环境

Server: Tencent Cloud 2 Core 4G CentOS7.6

Object storage: Qiniuyun OSS

Minimum configuration: 1 core 2G server (Close ElasticSearch)

## developmentenvironment

|       development tools       |                  illustrate                  |
| ----------------------------- | -------------------------------------------- |
| IDEA                          | Java Development Tools IDE                   |
| VSCode                        | Vue development tools IDE                    |
| Navicat                       | MySQL Remote Connection Tool                 |
| Another Redis Desktop Manager | Redis remote connection tool                 |
| finalshell                    | Linux remote connection and file upload tool |

| development environment | Version |
| ----------------------- | ------- |
| JDK                     | 1.8     |
| MySQL                   | 5.5.0   |
| Redis                   | 6.0.5   |
| Elasticsearch           | 7.9.2   |