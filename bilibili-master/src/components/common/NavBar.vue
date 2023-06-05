<template>
  <div class="navbar_main">
    <!-- 导航栏左边部分 -->
    <div class="nav_left">
      <ul>
        <li class="nav_left_item" @click="returnHome">
          <a href="#/home">
            <i class="iconfont icon-bilibili home_logo"></i>
          </a>
        </li>
        <li class="nav_left_item">番剧</li>
        <li class="nav_left_item">
          <el-popover placement="bottom-start" trigger="hover">
            <div class="nav-game">
              <div class="n-g-left">
                <div class="n-g-img">
                  <img src="../../assets/img/game1.png" alt="" />
                </div>
                <div class="n-g-recommend">
                  <span class="recommend-item">
                    <img src="../../assets/img/game2.png" alt="" />
                  </span>
                  <span class="recommend-item">
                    <img src="../../assets/img/game3.png" alt="" />
                  </span>
                  <span class="recommend-item">
                    <img src="../../assets/img/game4.png" alt="" />
                  </span>
                </div>
              </div>
              <el-divider direction="vertical"></el-divider>
              <div class="n-g-right">
                <ul>
                  <li class="n-g-title">漫威超级战争</li>
                  <li class="n-g-title">代号：弥弥尔</li>
                  <li class="n-g-title">LOL全球总决赛</li>
                  <li class="n-g-title">NBA决赛让3追4</li>
                  <li class="n-g-title">数码宝贝：新纪元</li>
                  <li class="n-g-title">我的世界66</li>
                </ul>
              </div>
            </div>
            <a slot="reference">游戏中心</a>
          </el-popover>
        </li>
        <li class="nav_left_item">
          <el-popover placement="bottom-start" trigger="hover">
            <div class="nav-zhibo">
              <div class="n-z-left">
                <div class="n-z-l-title">热门直播：</div>
                <div class="n-z-l-main">
                  <span class="n-z-l-item">
                    <img src="../../assets/img/zhubo1.png" />
                    <p>坏学姐</p>
                  </span>
                  <span class="n-z-l-item">
                    <img src="../../assets/img/zhubo2.png" />
                    <p>喵喵喵</p>
                  </span>
                  <span class="n-z-l-item">
                    <img src="../../assets/img/zhubo3.png" />
                    <p>甜幼学妹</p>
                  </span>
                  <span class="n-z-l-item">
                    <img src="../../assets/img/zhubo4.png" />
                    <p>要柔柔</p>
                  </span>
                  <span class="n-z-l-item">
                    <img src="../../assets/img/zhubo5.png" />
                    <p>琉璃不琉璃</p>
                  </span>
                  <span class="n-z-l-item">
                    <img src="../../assets/img/zhubo6.png" />
                    <p>梦里有我</p>
                  </span>
                </div>
              </div>
              <el-divider class="hot-divider" direction="vertical"></el-divider>
              <div class="n-z-right">
                <div class="n-z-l-title">热门活动：</div>
                <img src="../../assets/img/hot.png" alt="" />
                <img src="../../assets/img/hot2.png" alt="" />
              </div>
            </div>
            <a slot="reference">直播</a>
          </el-popover>
        </li>
        <li class="nav_left_item">会员购</li>
        <li class="nav_left_item">
          <el-popover
            placement="bottom-start"
            title="标题"
            width="200"
            trigger="hover"
            content="漫画漫画漫画漫画"
          >
            <a slot="reference">漫画</a>
          </el-popover>
        </li>
        <li class="nav_left_item">赛事</li>
        <li class="nav_left_item">
          <el-popover placement="bottom-start" trigger="hover">
            <div class="nav-app">
              <img src="../../assets/img/saoma.png" alt="" />
            </div>
            <a slot="reference">
              <i class="iconfont icon-shouji app_logo"></i>
              下载App
            </a>
          </el-popover>
        </li>
      </ul>
    </div>

    <!-- 导航栏中间区域 -->
    <div class="nav_center">
      <div
        class="nav_center_search"
        v-if="searchExist"
        v-show="searchVisible"
        ref="NavSearch"
      >
        <!-- 输入框 -->
        <el-autocomplete
          class="search_inp"
          popper-class="my-autocomplete"
          v-model="searchData"
          :placeholder="searchDefaults"
          :fetch-suggestions="querySearch"
          @select="handleSelect"
          @keyup.enter.native="searchConfirm"
          clearable
        >
          <template slot-scope="{ item }">
            <div class="hot_search">
              <span class="hot_pos">{{ item.pos }}</span>
              <span class="hot_keyword">{{ item.keyword }}</span>
              <span class="hot_icon">
                <!-- :src="item.icon ? item.icon : '../../assets/img/jian.png'" -->
                <img :src="hotIconImg(item)" v-if="hotIconImg(item)" />
              </span>
            </div>
          </template>
        </el-autocomplete>

        <el-button class="search_btn" type="info" plain @click="searchConfirm">
          <i class="iconfont icon-sousuo search_logo"></i>
        </el-button>
      </div>
    </div>

    <!-- 导航栏右边区域 -->
    <div class="nav_right">
      <ul>
        <!-- 头像 -->
        <li class="nav_right_item">
          <el-avatar
            size="medium"
            src="https://i0.hdslb.com/bfs/face/9e684120bdf30f9c7130de8b3f3b004e589f46ef.jpg@96w_96h_1c.webp"
          ></el-avatar>
        </li>
        <li class="nav_right_item">
          <el-popover placement="bottom-start" trigger="hover">
            <div class="bigmember">
              <div class="bigmember-title">精彩推荐</div>
              <div class="bigmember-img">
                <img src="../../assets/img/bighuiyuan.png" alt="" />
              </div>
              <p>0.6元/天开超Q双会员领限量装扮</p>
              <div class="bigmember-btn">
                <el-button type="primary" size="small">开通大会员</el-button>
              </div>
            </div>
            <a slot="reference">大会员</a>
          </el-popover>
        </li>
        <li class="nav_right_item">
          <el-badge :value="8" class="item">
            <el-popover placement="bottom-start" trigger="hover">
              <div class="message">
                <ul>
                  <li class="message-item">
                    <span>回复我的</span>
                    <el-badge :value="3" class="item message-item-spot">
                      <span>&nbsp;</span>
                    </el-badge>
                  </li>
                  <li class="message-item">
                    <span>@我的</span>
                  </li>
                  <li class="message-item">
                    <span>收到的赞</span>
                    <el-badge :value="5" class="item message-item-spot">
                      <span>&nbsp;</span>
                    </el-badge>
                  </li>
                  <li class="message-item">
                    <span>系统通知</span>
                  </li>
                  <li class="message-item">
                    <span>我的消息</span>
                  </li>
                </ul>
              </div>
              <a slot="reference">消息</a>
            </el-popover>
          </el-badge>
        </li>
        <li class="nav_right_item">
          <el-badge :value="12" class="item">
            <el-popover
              placement="bottom-start"
              title="标题"
              width="200"
              trigger="hover"
              content="RNG VS FPX"
            >
              <a slot="reference">动态</a>
            </el-popover>
          </el-badge>
        </li>
        <li class="nav_right_item">
          <el-popover
            placement="bottom-start"
            title="标题"
            width="200"
            trigger="hover"
            content="RNG VS FPX"
          >
            <a slot="reference">收藏</a>
          </el-popover>
        </li>
        <li class="nav_right_item">
          <el-popover
            placement="bottom-start"
            title="标题"
            width="200"
            trigger="hover"
            content="RNG VS FPX"
          >
            <a slot="reference">历史</a>
          </el-popover>
        </li>
        <li class="nav_right_item">创作中心</li>
        <li class="nav_right_item">
          <el-button type="danger">投稿</el-button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "NavBar",
  props: {
    // 热搜数据
    hotsearch: {
      type: Array,
      default() {
        return [];
      },
    },
  },
  data() {
    return {
      // 用于判断搜索框是否存在
      searchExist: true,
      // 搜索区域的显示与隐藏
      searchVisible: true,
      searchInput: "",
      // 屏幕的宽度
      screenWidth: document.body.clientWidth,
      // 热搜数据
      hotData: this.hotsearch,
      // 输入框的数据
      searchData: "",
      // 默认搜索词
      searchDefaults: "请输入内容",
    };
  },
  created() {
    // 开始创建dom时先判断一下 搜索区域是否显示
    if (this.screenWidth <= 1200) {
      this.searchVisible = false;
    }
    if (this.$route.path === "/search") {
      this.searchExist = false;
    }

    // 请求默认搜索词
    // this.getDefaultWords();

    // 请求搜索建议
    // this.getSuggest();
  },
  mounted() {
    const that = this;
    // 在页面mounted时，挂载window.onresize方法
    // 监听窗口变化
    window.onresize = () => {
      return (() => {
        that.screenWidth = document.body.clientWidth;
      })();
    };

    // 获取数据
    // this.restaurants = this.loadAll();
  },
  watch: {
    screenWidth(val) {
      // 为了避免频繁触发resize函数导致页面卡顿，使用定时器
      if (!this.timer) {
        this.screenWidth = val;
        this.timer = true;
        const that = this;
        setTimeout(function () {
          if (that.screenWidth <= 1200) {
            that.searchVisible = false;
          } else {
            that.searchVisible = true;
          }
          that.timer = false;
        }, 400);
      }
    },
    // 监听热搜的数据 实时更新data里的值
    hotsearch(val) {
      this.hotData = val;
    },
  },
  methods: {
    // 返回首页
    returnHome() {
      if (this.$route.path === "/home") {
        return;
      }
      this.$router.push("/home");
    },
    // 输入框获取焦点时调用的方法
    querySearch(queryString, cb) {
      let results = this.hotData;
      // 调用 callback 返回建议列表的数据
      cb(results);
    },
    // 判断选中了哪个热搜
    handleSelect(item) {
      this.searchData = item.keyword;
      this.routerJump();
    },
    // 判断热搜图片
    hotIconImg(item) {
      if (item.icon === "") {
        return false;
      }
      return item.icon;
    },

    // 确认搜索
    searchConfirm() {
      if (this.searchData === "") {
        this.searchData = this.searchDefaults;
      }
      this.routerJump();
      /* this.$message({
            // 可关闭
            showClose: true,
            message: "搜索内容为空，无法搜索!",
            type: "warning",
            // 持续时间
            duration: "500",
          }); */
    },

    // 路由跳转
    routerJump() {
      // 跳转到搜索页面
      this.$router.push(`/search?keyword=${this.searchData}`);
    },

    // 请求默认关键词
    async getDefaultWords() {
      try {
        const { data: res } = await this.$axiosbili({
          url: "/defaultsearch/x/web-interface/search/default",
          method: "get",
        });
        if (res.data.show_name === undefined) {
          return;
        }
        this.searchDefaults = res.data.show_name;
      } catch (err) {
        this.searchDefaults = "请输入内容";
      }
    },

    // 请求搜索建议
    async getSuggest() {
      const { data: res } = await this.$axiosbili.get("/defaultsearch/suggest");
    },
  },
};
</script>

<style scoped>
* {
  color: #fff;
}
.navbar_main {
  display: flex;
  height: 56px;
  /* justify-content: space-between; */
  align-items: center;
}
/* nav左边部分 */
.nav_left {
  width: 434px;
  height: 100%;
}

.nav_left ul {
  display: flex;
  padding: 0;
  margin-top: 16px;
  justify-content: space-around;
}

.nav_left_item {
  cursor: pointer;
  font-size: 14px;
  color: #fff;
}

.home_logo {
  color: #fff;
}
.app_logo {
  font-size: 16px;
}

/* nav 游戏 */
.nav-game {
  display: flex;
  justify-content: space-between;
  width: 350px;
}
.n-g-left {
  width: 60%;
}
.n-g-img {
  width: 100%;
  border-radius: 5px;
  overflow: hidden;
  background: pink;
  padding: 0;
}
.n-g-img img {
  /* 块级元素内部默认有行框，行框撑高了块级元素。
      img和其他块级元素并列的时候，由于img默认是display:inline-block，
      产生匿名块框包裹img，匿名块框内部生成了行框，多余了几个像素 */
  display: block;
  width: 100%;
}

.n-g-recommend {
  width: 100%;
  display: flex;
}
.recommend-item {
  flex: 1;
  margin-top: 10px;
  border-radius: 15px;
  overflow: hidden;
}
.recommend-item:nth-child(2) {
  margin: 10px 15px 0;
}
.recommend-item img {
  display: block;
  width: 100%;
}

/* 下划线 */
.el-divider {
  height: 180px;
}

.n-g-right {
  width: 30%;
}

.n-g-title {
  display: block;
  color: #555;
  font-size: 12px;
  line-height: 30px;
}

/* nav 直播 */
.nav-zhibo {
  width: 400px;
  display: flex;
  justify-content: space-between;
}
.n-z-left {
  width: 55%;
}
.n-z-l-title {
  font-size: 16px;
  color: #ec81a7;
}
.n-z-l-main {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.n-z-l-item {
  display: inline-block;
  width: 28%;
  margin-top: 10px;
}
.n-z-l-item img {
  width: 100%;
  border-radius: 50%;
}
.n-z-l-item p {
  color: #555;
  font-size: 12px;
  /* 一行显示 */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
  overflow: hidden;
}
/* 下划线 */
.hot-divider {
  height: 208px;
}

.n-z-right {
  width: 40%;
}
.n-z-right img {
  width: 100%;
  margin-top: 20px;
}

/* nav 扫码 */
.nav-app {
  width: 200px;
}
.nav-app img {
  width: 100%;
}

/* nav中间部分 */
.nav_center {
  flex: 1;
  margin: 0 30px;
}
.nav_center_search {
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 0 2vw;
}
.search_inp {
  flex: 1;
  border-top-right-radius: 0 !important;
  border-bottom-right-radius: 0 !important;
}

.hot_pos {
  display: inline-block;
  width: 24px;
  height: 24px;
  text-align: center;
  font-size: 12px;
  color: #555;
}
.hot_keyword {
  display: inline-block;
  font-size: 12px;
  color: #555;
  margin: 0 8px;
}

.hot_icon {
  display: inline-block;
  width: 14px;
  height: 14px;
}
.hot_icon img {
  width: 100%;
  height: 100%;
}

.search_btn {
  width: 48px;
  height: 40px;
  margin: 0;
  padding: 0;
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}
.search_logo {
  font-size: 24px;
  font-weight: 600;
  color: #2999d9;
}

/* nav右边部分 */
.nav_right {
  height: 100%;
  width: 454px;
}

.nav_right ul {
  display: flex;
  margin: 0;
  margin-top: 8px;
  padding: 0;
  justify-content: space-around;
  align-items: center;
}

.nav_right_item {
  cursor: pointer;
  font-size: 14px;
  color: #fff;
}

/* 大会员 */
.bigmember {
  width: 200px;
  font-size: 12px;
}
.bigmember-title {
  color: #555;
  font-weight: 600;
}
.bigmember-img {
  margin-top: 10px;
}
.bigmember-img img {
  width: 100%;
}
.bigmember p {
  color: #555;
  margin: 10px 0;
}
.bigmember-btn {
  text-align: center;
}

/* 消息 */
.message {
  width: 100px;
}
.message-item {
  cursor: pointer;
  display: block;
  margin-bottom: 10px;
  padding-left: 8px;
}
.message-item span {
  color: #555;
  font-size: 13px;
}
.message-item-spot {
  float: right;
}
</style>