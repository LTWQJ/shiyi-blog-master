<template>
  <v-navigation-drawer
    app
    v-model="drawer"
    width="250"
    disable-resize-watcher
    right
    overlay-opacity="0.8"
  >
    <!-- 博主介绍 -->
    <div class="blogger-info">
      <v-avatar size="110" style="margin-bottom:0.5rem">
        <img :src="this.$store.state.blogInfo.webSite.authorAvatar" />
      </v-avatar>
    </div>
    <!-- 博客信息 -->
    <div class="blog-info-wrapper">
      <div class="blog-info-data">
        <router-link to="/archives">
          <div style="font-size: 0.875rem">文章</div>
          <div style="font-size: 1.125rem;">
            {{ this.$store.state.blogInfo.count.articleCount }}
          </div>
        </router-link>
      </div>
      <div class="blog-info-data">
        <router-link to="/categories">
          <div style="font-size: 0.875rem">分类</div>
          <div style="font-size: 1.125rem">
            {{ this.$store.state.blogInfo.count.categoryCount }}
          </div>
        </router-link>
      </div>
      <div class="blog-info-data">
        <router-link to="/tags">
          <div style="font-size: 0.875rem">标签</div>
          <div style="font-size: 1.125rem">
            {{ this.$store.state.blogInfo.count.tagCount }}
          </div>
        </router-link>
      </div>
    </div>
    <hr />
    <!-- 页面导航 -->
    <div class="menu-container">
      <div class="menus-item">
        <router-link to="/">
          <i class="iconfont iconzhuye" /> 首页
        </router-link>
      </div>
      <div class="menus-item">
        <router-link to="/archives">
          <i class="iconfont iconguidang" /> 归档
        </router-link>
      </div>
      <div class="menus-item">
        <router-link to="/albums">
          <i class="iconfont iconxiangce1" /> 相册
        </router-link>
      </div>
      <div class="menus-item">
        <router-link to="/categories">
          <i class="iconfont iconfenlei" /> 分类
        </router-link>
      </div>
      <div class="menus-item">
        <router-link to="/tags">
          <i class="iconfont iconbiaoqian" /> 标签
        </router-link>
      </div>
      <div class="menus-item">
        <router-link class="menu-btn" to="/trendingtoday">
          <svg t="1684664895148" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="20802" width="15" height="12"><path d="M526.2848 296.448a92.16 92.16 0 0 0-75.7248 33.1264 130.1504 130.1504 0 0 0-25.6 85.4016 129.6384 129.6384 0 0 0 25.6 84.8896c18.688 22.2208 46.7456 34.304 75.7248 32.6144a94.0544 94.0544 0 0 0 75.4688-31.232 132.3008 132.3008 0 0 0 26.9312-86.272 136.3456 136.3456 0 0 0-26.9312-87.296 93.2352 93.2352 0 0 0-75.4688-31.232zM0 107.7248v624.9472c0 59.4944 48.2816 107.776 107.776 107.776h279.1936L512 1024l123.9552-183.5008h280.2688A107.776 107.776 0 0 0 1024 732.672V107.776A107.776 107.776 0 0 0 916.224 0H107.776A107.776 107.776 0 0 0 0 107.776z m301.824 465.1008h-5.4272a23.4496 23.4496 0 0 1-23.1424-23.1424v-91.648a23.4496 23.4496 0 0 0-23.1936-23.4496h-112.64a23.4496 23.4496 0 0 0-23.4496 23.4496v91.648a23.4496 23.4496 0 0 1-23.1424 23.1424h-5.12a23.4496 23.4496 0 0 1-23.1936-23.1424V281.6c0-12.8 10.3936-23.1936 23.1936-23.1936h5.12c12.8 0 23.1424 10.3936 23.1424 23.1936v84.6336c0 12.9536 10.496 23.4496 23.4496 23.4496H250.368a23.4496 23.4496 0 0 0 23.1936-23.4496V281.6c0-12.6976 10.24-23.04 22.9376-23.1936h5.12a22.8864 22.8864 0 0 1 23.1424 22.6304v270.0288a23.1936 23.1936 0 0 1-22.8864 21.8112z m338.176-40.1408a144.9984 144.9984 0 0 1-113.7152 46.3872 144.1792 144.1792 0 0 1-113.7152-46.8992 168.96 168.96 0 0 1-39.0656-116.1728 169.216 169.216 0 0 1 39.0656-116.6848 141.7216 141.7216 0 0 1 113.664-47.104c43.008-2.2528 84.736 14.848 113.7664 46.592 27.4944 32.7168 41.6256 74.5472 39.6288 117.248 2.048 42.496-12.1344 84.1728-39.6288 116.6336z m299.3664-230.4h-58.9824a22.1184 22.1184 0 0 0-21.8624 22.1184v226.304a22.1184 22.1184 0 0 1-22.0672 22.1184h-7.5776a22.1184 22.1184 0 0 1-22.0672-22.0672V323.3792a22.1184 22.1184 0 0 0-21.8112-22.1184h-59.2896a22.1184 22.1184 0 0 1-21.8624-22.0672c0-12.0832 9.7792-21.8624 21.8624-21.8624h213.6576a21.8112 21.8112 0 0 1 22.1184 21.8624 22.1184 22.1184 0 0 1-22.1184 23.1424z" fill="#ffffff" p-id="20803"></path></svg>
         <span style="margin-left:40px">今日热点</span>
        </router-link>
      </div>
      <div class="menus-item">
        <router-link to="/links">
          <i class="iconfont iconlianjie" /> 友链
        </router-link>
      </div>
      <div class="menus-item">
        <router-link class="menu-btn" to="/message">
          <svg t="1684164816642" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8045" width="14" height="14"><path d="M599.707826 174.970435a244.869565 244.869565 0 0 1 244.869565 244.869565v178.086957a242.42087 242.42087 0 0 1-15.137391 83.47826l-8.681739 23.819131 5.12 24.486956c12.243478 60.326957 17.363478 89.043478 19.589565 104.18087 0 6.010435 1.335652 10.907826 1.78087 14.914783a171.408696 171.408696 0 0 1-28.716522-2.893914c-29.829565-6.455652-61.885217-12.688696-95.944348-18.69913l-22.260869-4.006956-22.26087 7.346086a243.088696 243.088696 0 0 1-78.803478 13.356522h-178.086957a244.869565 244.869565 0 0 1-244.869565-244.869565v-178.086957a244.869565 244.869565 0 0 1 244.869565-244.869565h178.086957m0-89.043478h-178.086957a333.913043 333.913043 0 0 0-333.913043 333.913043v178.086957a333.913043 333.913043 0 0 0 333.913043 333.913043h178.086957a328.793043 328.793043 0 0 0 107.297391-18.031304c29.829565 5.342609 61.44 11.353043 93.050435 18.031304a260.229565 260.229565 0 0 0 52.535652 6.233044c78.58087 0 90.601739-54.316522 81.029565-117.537391-4.006957-26.045217-12.243478-66.782609-20.48-108.633044a333.913043 333.913043 0 0 0 20.48-113.975652v-178.086957a333.913043 333.913043 0 0 0-333.913043-333.913043z" fill="#ffffff" p-id="8046"></path><path d="M467.478261 244.869565h89.043478a222.608696 222.608696 0 0 1 222.608696 222.608696v89.043478a222.608696 222.608696 0 0 1-222.608696 222.608696h-89.043478a222.608696 222.608696 0 0 1-222.608696-222.608696v-89.043478a222.608696 222.608696 0 0 1 222.608696-222.608696z" fill="#ffffff" opacity=".1" p-id="8047"></path><path d="M435.2 429.857391v164.285218a41.405217 41.405217 0 0 0 66.782609 34.504348l107.742608-82.142609a44.521739 44.521739 0 0 0 0-69.008696l-107.742608-82.142609a41.405217 41.405217 0 0 0-66.782609 34.504348z" fill="#ffffff" p-id="8048"></path></svg>
          <span style="margin-left:40px">说说</span>
        </router-link>
      </div>
      <div class="menus-item">
        <a href="http://localhost:3002/#/music/picked" class="menu-btn" >
          <svg t="1684153821482" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2428" width="13" height="13"><path d="M512 972.8C258.048 972.8 51.2 765.952 51.2 512S258.048 51.2 512 51.2s460.8 206.848 460.8 460.8c0 17.408-13.312 30.72-30.72 30.72s-30.72-13.312-30.72-30.72c0-220.16-179.2-399.36-399.36-399.36S112.64 291.84 112.64 512s179.2 399.36 399.36 399.36c17.408 0 30.72 13.312 30.72 30.72s-13.312 30.72-30.72 30.72z" p-id="2429" fill="#ffffff"></path><path d="M512 972.8C258.048 972.8 51.2 765.952 51.2 512S258.048 51.2 512 51.2s460.8 206.848 460.8 460.8c0 83.968-22.528 164.864-65.536 236.544-9.216 14.336-27.648 19.456-41.984 10.24-14.336-9.216-19.456-27.648-10.24-41.984 36.864-61.44 56.32-133.12 56.32-204.8 0-220.16-179.2-399.36-399.36-399.36S112.64 291.84 112.64 512s179.2 399.36 399.36 399.36c91.136 0 177.152-29.696 247.808-87.04 6.144-5.12 13.312-11.264 19.456-16.384 5.12-4.096 9.216-9.216 14.336-13.312 12.288-12.288 31.744-12.288 43.008 0 12.288 12.288 12.288 31.744 0 43.008-5.12 5.12-10.24 10.24-16.384 15.36-7.168 6.144-14.336 13.312-22.528 19.456C716.8 937.984 617.472 972.8 512 972.8z" p-id="2430" fill="#ffffff"></path><path d="M752.64 352.256c-9.216 0-18.432-4.096-24.576-11.264-41.984-53.248-102.4-89.088-169.984-101.376-16.384-3.072-27.648-18.432-24.576-35.84 3.072-16.384 18.432-27.648 35.84-24.576 81.92 14.336 155.648 57.344 206.848 122.88 10.24 13.312 8.192 32.768-5.12 43.008-5.12 5.12-11.264 7.168-18.432 7.168zM381.952 795.648c-23.552 0-47.104-6.144-68.608-18.432-31.744-18.432-55.296-48.128-64.512-83.968-9.216-35.84-5.12-72.704 13.312-104.448 18.432-31.744 48.128-55.296 83.968-64.512l73.728-19.456c35.84-9.216 72.704-5.12 104.448 13.312 31.744 18.432 55.296 48.128 64.512 83.968 9.216 35.84 5.12 72.704-13.312 104.448-18.432 31.744-48.128 55.296-83.968 64.512l-73.728 19.456c-11.264 3.072-23.552 5.12-35.84 5.12z m73.728-234.496c-7.168 0-13.312 1.024-19.456 3.072L362.496 583.68c-19.456 5.12-35.84 18.432-46.08 35.84s-13.312 38.912-7.168 58.368c5.12 19.456 18.432 35.84 35.84 46.08s38.912 13.312 58.368 7.168l73.728-19.456C495.616 706.56 512 693.248 522.24 675.84c10.24-17.408 13.312-38.912 7.168-58.368-5.12-19.456-18.432-35.84-35.84-46.08-11.264-7.168-24.576-10.24-37.888-10.24z" p-id="2431" fill="#ffffff"></path><path d="M563.2 665.6c-17.408 0-30.72-13.312-30.72-30.72V215.04c0-17.408 13.312-30.72 30.72-30.72s30.72 13.312 30.72 30.72v419.84c0 17.408-13.312 30.72-30.72 30.72z" p-id="2432" fill="#ffffff"></path></svg>
          <span style="margin-left:40px">音乐</span>
        </a>
      </div>
      <div class="menus-item">
        <router-link class="menu-btn" to="/message">
          <svg  t="1684200809200" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="12152" width="12" height="12"><path d="M294.353823 0.160615H31.994981a31.994981 31.994981 0 0 0-31.994981 31.994981v959.849423a31.994981 31.994981 0 0 0 31.994981 31.994981h262.358842a31.994981 31.994981 0 0 0 31.994981-31.994981V32.155596a31.994981 31.994981 0 0 0-31.994981-31.994981z m-127.979923 870.263477a79.987452 79.987452 0 1 1 76.787954-79.987452 79.987452 79.987452 0 0 1-79.987452 79.987452z m76.787954-343.626093a31.994981 31.994981 0 0 1-31.994981 31.99498H115.181931a31.994981 31.994981 0 0 1-31.994981-31.99498V165.254716a31.994981 31.994981 0 0 1 31.994981-31.994981h95.984942a32.63488 32.63488 0 0 1 31.994981 31.994981z" fill="#ffffff" p-id="12153"></path><path d="M163.174402 746.283567a44.153073 44.153073 0 1 0 44.153074 44.153073 44.153073 44.153073 0 0 0-44.153074-44.153073zM643.099114 0.160615H383.939769a31.994981 31.994981 0 0 0-31.99498 31.994981v959.849423a31.994981 31.994981 0 0 0 31.99498 31.994981h262.358843a31.994981 31.994981 0 0 0 31.994981-31.994981V32.155596a31.994981 31.994981 0 0 0-35.194479-31.994981zM511.919693 870.424092a79.987452 79.987452 0 1 1 79.987452-79.987452A79.987452 79.987452 0 0 1 511.919693 870.424092z m79.987452-343.626093a31.994981 31.994981 0 0 1-31.994981 31.99498h-95.984943a31.994981 31.994981 0 0 1-31.99498-31.99498V165.254716a31.994981 31.994981 0 0 1 31.99498-31.994981h95.984943a31.994981 31.994981 0 0 1 31.994981 31.994981z" fill="#ffffff" p-id="12154"></path><path d="M511.919693 746.283567a44.153073 44.153073 0 1 0 44.153073 44.153073 44.153073 44.153073 0 0 0-44.153073-44.153073zM991.844404 0.160615h-262.358842a31.994981 31.994981 0 0 0-31.994981 31.994981v959.849423a31.994981 31.994981 0 0 0 31.994981 31.994981h262.358842a31.994981 31.994981 0 0 0 31.994981-31.994981V32.155596a31.994981 31.994981 0 0 0-31.994981-31.994981z m-131.179421 870.263477a79.987452 79.987452 0 1 1 79.987452-79.987452 79.987452 79.987452 0 0 1-79.987452 79.987452z m79.987452-343.626093a31.994981 31.994981 0 0 1-31.994981 31.99498h-95.984942a31.994981 31.994981 0 0 1-31.994981-31.99498V165.254716a32.63488 32.63488 0 0 1 31.994981-31.994981h95.984942a31.994981 31.994981 0 0 1 31.994981 31.994981z" fill="#ffffff" p-id="12155"></path><path d="M860.664983 746.283567a44.153073 44.153073 0 1 0 44.153074 44.153073 44.153073 44.153073 0 0 0-44.153074-44.153073z" fill="#ffffff" p-id="12156"></path></svg>
          <span style="margin-left:40px">资源导航</span>
        </router-link>
      </div>
      <div class="menus-item">
        <router-link to="/about">
          <i class="iconfont iconzhifeiji" /> 关于
        </router-link>
      </div>
      <div class="menus-item">
        <router-link to="/message">
          <i class="iconfont iconpinglunzu" /> 留言
        </router-link>
      </div>
      <div class="menus-item" v-if="!this.$store.state.avatar">
        <a @click="openLogin"><i class="iconfont icondenglu" /> 登录 </a>
      </div>
      <div v-else>
        <div class="menus-item">
          <router-link to="/user">
            <i class="iconfont icongerenzhongxin" /> 个人中心
          </router-link>
        </div>
        <div class="menus-item">
          <a @click="logout"><i class="iconfont icontuichu" /> 退出</a>
        </div>
      </div>
    </div>
  </v-navigation-drawer>
</template>
<style scoped>
.blogger-info {
  padding: 26px 30px 0;
  text-align: center;
}
.blog-info-wrapper {
  display: flex;
  align-items: center;
  padding: 12px 10px 0;
}
.blog-info-data {
  flex: 1;
  line-height: 2;
  text-align: center;
}
hr {
  border: 2px dashed #d2ebfd;
  margin: 20px 0;
}
.menu-container {
  padding: 0 10px 40px;
  animation: 0.8s ease 0s 1 normal none running sidebarItem;
}
.menus-item a {
  padding: 6px 30px;
  display: block;
  line-height: 2;
}
.menus-item i {
  margin-right: 2rem;
}
@keyframes sidebarItem {
  0% {
    transform: translateX(200px);
  }
  100% {
    transform: translateX(0);
  }
}
</style>

<script>
import {logout} from '../../api'
export default {
  data:function(){
    return {
      img: process.env.VUE_APP_IMG_API,
    }
  },
  computed: {
    drawer: {
      set(value) {
        this.$store.state.drawer = value;
      },
      get() {
        return this.$store.state.drawer;
      }
    },
    isLogin() {
      return this.$store.state.userId;
    }
  },
  methods: {
    openLogin() {
      this.$store.state.loginFlag = true;
    },
    logout() {
      //如果在个人中心则跳回上一页
      if (this.$route.path === "/user") {
        this.$router.go(-1);
      }
      logout().then(res => {
          this.$store.commit("logout");
          this.$toast({ type: "success", message: "注销成功" });
      }).catch(err =>{
        console.log(err)
      });;
    }
  }
};
</script>
