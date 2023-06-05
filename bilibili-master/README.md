## 仿哔哩哔哩的网页版

#### （仅有首页和搜索页面）

#### 线上地址：codeape.site:8181

#### b站效果展示视频：https://www.bilibili.com/video/bv1564y1U71T

#### csdn介绍：https://blog.csdn.net/weixin_52014110/article/details/116353612

#### 两个页面的效果展示：

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/20210502142358.png)

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210429171405003.png" style="zoom:40%;" />



点击图片中的内容，会跳转到官方b站的相应视频页面，由于网上没有视频的接口(人家赚钱的东西当然不能有啦😂)，所以就没有进行接下来的制作了。

#### 首页制作

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210429172400998.png" style="zoom:50%;" />

用 element-ui 和 html 加 css 相结合的方式尽可能的还原哔哩哔哩页面，首页主要布局分4部分

#### 1 navbar 绘制

​	自定义封装好 nav-bar 用于首页和搜索页面使用。搜索框会根据页面的宽度大小来显示与隐藏，主要功能代码如下

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501091718892.png" style="zoom:80%;" />

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501091748662.png" style="zoom:80%;" />

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501091811244.png" style="zoom:80%;" />

​	搜索框下方的提示使用 el-autocomplete 组件将获取到的数据进行效果展示

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/20210502142431.png" alt="image-20210501092214610" style="zoom:30%;" />

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501092545360.png" style="zoom:67%;" />

​																					数据获取

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501092729529.png" style="zoom:80%;" />

​																				html结构

#### 2 tab栏区域的绘制



#### 3 轮播图和轮播图右边区域的绘制

​	这里要提到一个访问外网接口跨域的问题

##### 解决方案如下：

​	在项目根路径中新建一个 vue.config.js 文件

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501093613995.png" style="zoom:80%;" />

​	在里面添加图中红框框出来的关键代码 （修改完 vue.config.js 文件记得要重新跑一次项目）

<img src="C:\Users\啊桓啊\AppData\Roaming\Typora\typora-user-images\image-20210501093522978.png" alt="image-20210501093522978" style="zoom:50%;" />

​	在 main.js 文件中导入并注册全局 axios

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501093759748.png" style="zoom:90%;" />

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501093812445.png)

​	在 Home.js 文件中使用，根据前面定义的名字，在这里直接使用就可以替换原路径

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501093909013.png" style="zoom:80%;" />

​	紧接着这里还会出现请求过来的图片的跨域问题。

##### 解决方案如下：

​	html 中新增 meta 标签关键代码：content="no-referrer"

```
<head>
....
<meta name="referrer" content="no-referrer" />
....
</head>
```

​	这里我觉得加在这个文件中就可以（但我没有尝试过，如果不行可尝试下面方法）

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501095636777.png)

​	一开始我不知道加在哪，因为这里是 vue 项目全是 .vue 文件，于是用了一种绕一点的方法

​	首先在 router 的配置文件中添加

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501095153172.png" style="zoom:80%;" />

​	再在 main.js 文件中添加如下代码 就相当于新增了一个 meta 标签

```
// 路由操作 解决跨域问题
router.beforeEach((to, from, next) => {
  /* 路由发生变化修改页面meta */
  if (to.meta.content) {
    let head = document.getElementsByTagName('head');
    let meta = document.createElement('meta');
    meta.name = to.meta.name;
    meta.content = to.meta.content;
    head[0].appendChild(meta)
  }
  /* 路由发生变化修改页面title */
  if (to.meta.title) {
    document.title = to.meta.title;
  }
  next()
});
```



#### 4 页面主要内容的绘制

​	由于需要多次复用，将视频内容展示和排行榜都各自封装成组件

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/20210502142515.png)

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210429173313819.png)

​	由于接口数据有限，排行榜的展示顺序是根据左边视频内容的播放量，来进行排序展示的。

​	

​		视频内容区域的接口提供了图片、标题等各种数据，但是没有链接数据。所以本网站点击了该区域会以标题	为搜索内容，跳转到搜索页面。当点击了搜索页面中的对象时，会跳转到b站原官网。



#### 搜索页面制作

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501091248934.png" style="zoom:50%;" />

#### 1 顶部继续复用封装好的 navbar

​	 但这里是搜索页面，不显示搜索框

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501091555936.png" style="zoom:67%;" />

#### 2 页面中的搜索和 tab 栏区域

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/20210502142555.png" style="zoom:40%;" />



#### 3 可折叠的选择标签区域

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/20210502142622.png)

​	这里的布局和功能的实现是最为复杂的，折叠区域用 el-collapse 进行功能绘制，在 el-collapse-item 中放入 el-radio-group 单选按钮来进行 标签 选择，展开的内容为：时长的标签和分区的标签。

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501102542347.png" style="zoom:67%;" />

##### 第一行标签 （综合排序等）

​	就是根据数据内容中的类型，来对原数据进行一次排序，下面是综合排序的方法，其他类似

```
// 综合排序的方法（得分最高）
    comprehensiveSort() {
      // sort 不传参就是按照字符编码的顺序进行排序
      // 提供比较函数，该函数要比较两个值
      // obj1 小于 obj2，在排序后的数组中 obj1 应该出现在 obj2 之前 返回一个小于 0 的值
      this.mainDataList.sort((obj1, obj2) => {
        return obj2.rank_score - obj1.rank_score;
      });
    },
```

##### 第二行标签 （全部时长等）

​	这里是先获取点击到的标签，改变 currentTime 的值

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210502112958006.png" style="zoom:67%;" />

​	接下来就可以监听 currentTime 的值，只要变化了就根据变化的数值来决定返回的时间

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210502113219422.png)

​	下面是点击tab栏时间的方法，就由于接口中获取过来的时间是一个字符串，所以下面要进行两次的时间格式的转换。

```
// 点击tab栏时间的方法
    allTimeMethods() {
      // this.mainDataListCopy 是获取到数值后，另外保存的一份副本
      // this.$lodash.cloneDeep 这是深拷贝
      let arr = this.$lodash.cloneDeep(this.mainDataListCopy);
      // 将时间转化为秒
      let arr2 = this.changeSeconds(arr);
      // 返回值是true还是false决定保留还是丢弃该元素。
      arr2 = arr2.filter((item) => {
        switch (this.currentTime) {
          case 0:
            return item.duration;
          case 600:
            return item.duration < 600;
          case 1800:
            return 600 <= item.duration && item.duration < 1800;
          case 3600:
            return 1800 <= item.duration && item.duration < 3600;
          default:
            return item.duration >= 3600;
        }
      });
      // 将时间格式化
      arr2 = this.formatSeconds(arr2);
      this.mainDataList = this.$lodash.cloneDeep(arr2);
    },
```

```
// 将接口中时间（3:23）转变为秒的方法
    changeSeconds(arr) {
      arr.forEach((value, index, array) => {
        let t = array[index].duration.split(":");
        array[index].duration = t[0] * 60 + parseInt(t[1]);
      });
      return arr;
    },
```

```
// 将秒钟格式化
    formatSeconds(arr2) {
      let timeFormat = "";
      for (let i in arr2) {
        timeFormat = "";
        allTime(arr2[i].duration);
        arr2[i].duration = timeFormat;
      }
      function allTime(time) {
        if (time < 60) {
          let s = time > 0 ? time : "";
          s = s <= 10 ? "0" + s : s;
          timeFormat = timeFormat + s;
          return;
        } else {
          let m = Math.floor(time / 60);
          m = m <= 10 ? "0" + m : m;
          timeFormat = timeFormat + m + ":";
          allTime(time - m * 60);
        }
      }
      return arr2;
    },
```

##### 第三行标签 （全部分区等）

​	在分区的标签中，要再嵌套一个 el-popover 的弹出框 下面分三部分进行介绍。

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501103049905.png" style="zoom:80%;" />

##### 	1 弹出框的使用

##### 	2 分区按钮

​		我们可以看到的分区按钮，但这里也出现了一些小问题（我解决了一个多小时）。

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501103358512.png)

​		第一个就是 el-popover 和 el-radio-button 嵌套使用时会出现 BUG ，解决方法就是：在 	el-radio-button 外部再嵌套一个button。

​		第二个就是当点击 el-radio-button 会 element-ui 设计时会触发两次的点击事件（别问我怎么知道的，这个 bug 导致我误以为弹出框显示不出来，因为一开始我弹出框是点击就显示，再点一下就消失的），所以这里可以用 防抖节流 的方法进行解决。

​		首先创建 preventReClick.js 文件 ，复制下面代码

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501104553209.png)

```
export default {
  install(Vue) {
    // 防止重复点击
    Vue.directive('preventReClick', {
      inserted(el, binding) {
        el.addEventListener('click', () => {
          if (!el.disabled) {
            el.disabled = true
            setTimeout(() => {
              el.disabled = false
            }, binding.value || 1000)
          }
        })
      }
    })
  }
}
```

​		紧接着在 main.js 中导入这个文件

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501104731196.png)

​		由于b站官网这里的弹出框点击其他地方是不消失的，后面我把 el-popover 的触发方式改为了 trigger="manual" 手动的，所以上面的方法可能就不需要了。但这里可以记录一下防止以后再次踩坑！！

##### 	3 选择分区后，弹出框的按钮

![](https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501103554927.png)

​		这里也存在点击两次的问题，但不会影响功能的实现，但可以作为优化然后记录一下

```
// 分区里面的对话框被点击了
partitionItemClick(e, item) {
  // 防止点击两次
  // 因为原生click事件会执行两次，第一次在label标签上，
  // 第二次在input标签上，故此处理
  if (e.target.tagName === "INPUT") return;
  let arr = this.$lodash.cloneDeep(this.mainDataListCopy);
  let arr2 = [];
  arr.forEach((value) => {
    if (value.typename === item) {
      arr2.push(value);
    }
  });
  this.mainDataList = this.$lodash.cloneDeep(arr2);
 },
```

#### 4 视频内容区域

​	由于要根据获取到的数据进行渲染，这里也是封装成一个独立的组件 videoitem.vue，便于复用。

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210501100713396.png" style="zoom:60%;" />



​	下面格式化标签中播放量和日期的计算属性

<img src="https://gitee.com/wooden-joint/bilibili/raw/master/img/image-20210502113846741.png" style="zoom:67%;" />

#### 项目心得体会

​		这是刚学习完一遍 vue ，用来练手和顺便复习 html + css + js 的项目，其中出现了很多的问题。虽然最后都一一解决了，但还是说明技术不过关。

​		这也是我写的第一篇博客，用于记录一些我所实现的功能的方法供大家参考，还有所遇到的问题以及解决方法希望能帮助到大家，写得不好的地方，希望大家轻喷！！🤣🤣