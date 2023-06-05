module.exports = {
  publicPath: "/",
  lintOnSave: process.env.NODE_ENV === "development",
  devServer: {
    disableHostCheck: true,
    port: 80,

    proxy: {
    '/daytext': { // 请求的代称，写在Axios里的BaseUrl
      target: 'https://api.vvhan.com/api/ian', // 真实请求URl--个性签名
      ws: true,
      changeOrigin: true, // 允许跨域
      pathRewrite: { //替换，通配/api的替换成对应字符
        //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
        //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
        //      */
        '^/daytext': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
      }
    },

    '/bilihotsearch': { // 请求的代称，写在Axios里的BaseUrl
      target: 'https://api.vvhan.com/api/hotlist?type=bili', // 真实请求URl--哔哩哔哩热搜榜
      ws: true,
      changeOrigin: true, // 允许跨域
      pathRewrite: { //替换，通配/api的替换成对应字符
        //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
        //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
        //      */
        '^/bilihotsearch': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
      }
    },
    '/infosignaturediagram': { // 请求的代称，写在Axios里的BaseUrl
      target: 'http://yichen.api.z7zz.cn/api/ipqmd.php', // 真实请求URl--信息签名图
      ws: true,
      changeOrigin: true, // 允许跨域
      pathRewrite: { //替换，通配/api的替换成对应字符
        //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
        //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
        //      */
        '^/infosignaturediagram': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
      }
    },
      '/todayinhistory': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/hotlist?type=history', // 真实请求URl--历史今天
        // http://ovoa.cc/api/lishi.php
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/todayinhistory': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
        }
      },

    '/douyinHotSearch': { // 请求的代称，写在Axios里的BaseUrl
      target: 'https://api.vvhan.com/api/hotlist?type=douyinHot', // 真实请求URl--抖音热搜
      ws: true,
      changeOrigin: true, // 允许跨域
      pathRewrite: { //替换，通配/api的替换成对应字符
        //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
        //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
        //      */
        '^/douyinHotSearch': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
      }
    },
    '/zhihuHotSearch': { // 请求的代称，写在Axios里的BaseUrl
      target: 'https://api.vvhan.com/api/hotlist?type=zhihuHot', // 真实请求URl--知乎热搜
      ws: true,
      changeOrigin: true, // 允许跨域
      pathRewrite: { //替换，通配/api的替换成对应字符
        //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
        //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
        //      */
        '^/zhihuHotSearch': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
      }
    },
    '/hupuNews': { // 请求的代称，写在Axios里的BaseUrl
      target: 'https://api.vvhan.com/api/hotlist?type=huPu', // 真实请求URl--虎扑新闻
      ws: true,
      changeOrigin: true, // 允许跨域
      pathRewrite: { //替换，通配/api的替换成对应字符
        //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
        //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
        //      */
        '^/hupuNews': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        //
      }
    },
      '/kenews': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/hotlist?type=36Ke', // 真实请求URl--36ke
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/kenews': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //
        }
      },
      '/baiduHotSpot': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/hotlist?type=baiduRD', // 真实请求URl--百度热点
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/baiduHotSpot': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
        }
      },
      '/itSTrendingOnWeibo': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/hotlist?type=wbHot', // 真实请求URl--微博热搜
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/itSTrendingOnWeibo': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
        }
      },
      '/postBarHotSearch': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/hotlist?type=baiduRY', // 真实请求URl--贴吧热搜
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/postBarHotSearch': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
        }
      },
      '/doubanMovie': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/douban', // 真实请求URl--豆瓣电影
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/doubanMovie': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
        }
      },
      '/todaySNews': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/60s?type=json', // 真实请求URl--今日新闻60秒
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/todaySNews': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
        }
      },
      '/ancientPoetry': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.yuxli.cn/api/shiju.php', // 真实请求URl--最美古诗诗句推荐
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/ancientPoetry': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
        }
      },
      '/itinfo': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/hotlist?type=itNews', // 真实请求URl--it最新资讯
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/itinfo': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
          //     '^/api': '/api'   //当你的接口中刚好有/api 时，采用这种方式
        }
      },
      '/chatgpt': { // 请求的代称，写在Axios里的BaseUrl
        target: 'http://ovoa.cc/api/ChatGPTPro.php?msg=', // 真实请求URl--chatgpt
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/chatgpt': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        }
      },
      '/lazyCalendar': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.vvhan.com/api/moyu?type=json', // 真实请求URl--懒人日历
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/lazyCalendar': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        }
      },
      '/qqmusic': { // 请求的代称，写在Axios里的BaseUrl
        target: 'https://api.xingzhige.com/API/NetEase_CloudMusic_hotReview/', // 真实请求URl--懒人日历
        ws: true,
        changeOrigin: true, // 允许跨域
        pathRewrite: { //替换，通配/api的替换成对应字符
          //     /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
          //       实际上访问的地址是：http://localhost:8088/spring/core/getData/userInfo,因为重写了 /api
          //      */
          '^/qqmusic': '' //当你的接口中没有/api字眼时，采用这种，直接替换成空即可
        }
      },
  },
},
  lintOnSave: false
};
