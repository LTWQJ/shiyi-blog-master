<template>
  <div class="search">
    <!-- 顶部搜索区域 -->
    <header class="search_header">
      <nav-bar></nav-bar>
    </header>

    <!-- 主体区域 -->
    <div class="search_main">
      <!-- 顶部搜索加tabs栏 -->
      <div class="head-contain">
        <div class="search-wrap">
          <div class="s-logo">
            <img src="../assets/img/search-logo.png" alt="" />
          </div>
          <div class="s-inp">
            <el-input
              class="search_inp"
              placeholder="请输入内容"
              v-model="searchInput"
              @keyup.enter.native="searchConfirm"
              clearable
            >
            </el-input>
          </div>
          <div class="s-btn">
            <el-button class="search_btn" type="search" @click="searchConfirm">
              <i class="iconfont icon-sousuo search_logo"></i>
              <span class="search_title">搜索</span>
            </el-button>
          </div>
        </div>
        <el-tabs v-model="tabsActiveName" @tab-click="tabsClick">
          <el-tab-pane label="综合" name="first"></el-tab-pane>
          <el-tab-pane label="视频99+" name="second"></el-tab-pane>
          <el-tab-pane label="番剧" name="third"></el-tab-pane>
          <el-tab-pane label="影视" name="fourth"></el-tab-pane>
          <el-tab-pane label="直播" name="fifth"></el-tab-pane>
          <el-tab-pane label="专栏" name="sixth"></el-tab-pane>
          <el-tab-pane label="话题" name="seventh"></el-tab-pane>
          <el-tab-pane label="用户99+" name="eighth"></el-tab-pane>
        </el-tabs>
      </div>

      <div class="body-contain">
        <!-- 折叠区域 -->
        <el-collapse
          v-model="collapseActiveName"
          @change="foldChange"
          accordion
        >
          <el-collapse-item name="1">
            <template slot="title">
              <el-radio-group
                @change="orderChange"
                v-model="sortActive"
                size="mini"
              >
                <el-radio-button label="综合排序"></el-radio-button>
                <!-- @click.native="comprehensiveSort" -->
                <el-radio-button label="最多点击"></el-radio-button>
                <!-- @click.native="mostClick" -->
                <el-radio-button label="最新发布"></el-radio-button>
                <!-- @click.native="latestRelease" -->
                <el-radio-button label="最多弹幕"></el-radio-button>
                <!-- @click.native="mostChat" -->
                <el-radio-button label="最多收藏"></el-radio-button>
                <!-- @click.native="mostCollection" -->
              </el-radio-group>
            </template>
            <!-- 展开的内容 -->
            <el-radio-group v-model="durationActive" size="mini">
              <el-radio-button
                label="全部时长"
                @click.native="currentTime = 0"
              ></el-radio-button>
              <el-radio-button
                label="10分钟以下"
                @click.native="currentTime = 600"
              ></el-radio-button>
              <el-radio-button
                label="10-30分钟"
                @click.native="currentTime = 1800"
              ></el-radio-button>
              <el-radio-button
                label="30-60分钟"
                @click.native="currentTime = 3600"
              ></el-radio-button>
              <el-radio-button
                label="60分钟以上"
                @click.native="currentTime = 9999"
              ></el-radio-button>
            </el-radio-group>

            <!-- 分区 -->
            <el-radio-group
              class="allpartition"
              v-model="partitionActive"
              size="mini"
            >
              <!-- 弹出框 -->
              <el-popover
                popper-class="partition-popover"
                v-for="(item, index) in partitionList"
                :key="index"
                placement="bottom"
                trigger="manual"
                @show="popoverShow(index)"
                @hide="popoverHide(index)"
                v-model="item.pvisible"
              >
                <!-- 分区按钮 -->
                <button
                  slot="reference"
                  style="background-color: transparent; border: none"
                  v-preventReClick="500"
                  @click="partitionClick(index, item.category)"
                >
                  <!-- v-preventReClick="1000"用于节流 防止多次点击 -->
                  <el-radio-button class="partition-item" :label="item.pname">
                  </el-radio-button>
                </button>

                <!-- 弹出框里面的按钮 -->
                <div class="partition-item-i">
                  <el-radio-group size="mini" v-model="item.index">
                    <el-radio-button
                      v-for="(item2, index2) in item.category"
                      :key="index2"
                      :label="index2"
                      v-preventReClick="500"
                      @click.native="partitionItemClick($event, item2)"
                      >{{ item2 }}
                    </el-radio-button>
                  </el-radio-group>
                </div>
              </el-popover>
            </el-radio-group>
          </el-collapse-item>
        </el-collapse>

        <!-- 分割线 -->
        <el-divider></el-divider>

        <!-- 视频内容 -->
        <div v-show="mainDataYes">
          <div class="video-list">
            <video-item
              class="main-data-item"
              :class="currentIndex == index ? 'item-hover' : ''"
              v-for="(item, index) in mainDataList"
              :key="index"
              :main-data="item"
              @mouseenter.native="enter(index)"
              @mouseleave.native="leave()"
            ></video-item>
          </div>
          <!-- 分页功能 -->
          <el-pagination
            :background="true"
            layout="prev, pager, next"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :total="500"
          >
          </el-pagination>
        </div>
        <div class="video-list-no" v-show="!mainDataYes">
          <img src="../assets/img/no-data.png" alt="" />
        </div>
      </div>
    </div>

    <!-- 底部 -->
    <v-footer class="home-footer"></v-footer>

    <!-- 回到顶部 -->
    <el-backtop>
      <div class="backtop-main">
        <img src="../assets/img/backtop.png" alt="" />
      </div>
    </el-backtop>
  </div>
</template>

<script>
import VideoItem from "./common/videoitem/VideoItem";

// 导入分区的静态数据
import partitionData from "./partitionList";

export default {
  name: "search",
  components: {
    VideoItem,
  },
  data() {
    return {
      // 搜索输入框的数据  url 上的keyword
      searchInput: this.$route.query.keyword,
      // 激活的tabs
      tabsActiveName: "first",
      // 展开name为1的折叠板 就是仅有的那个折叠板
      collapseActiveName: "1",
      // 激活的综合排序
      sortActive: "综合排序",
      // 当前的排序方式
      currentOrder: "default",
      // 激活的时长
      durationActive: "全部时长",
      // 激活的全部分区
      partitionActive: "全部分区",
      // 全部分区的数据 partitionData(静态数据)
      partitionList: partitionData,
      // 主要内容数据
      mainDataList: [],
      mainDataListCopy: [],
      // 判断是否有数据 显示没有数据图片
      mainDataYes: true,
      // 鼠标移进的当前item
      currentIndex: null,
      // 判断当前选择的时间
      currentTime: 0,
      // 当前页码
      currentPage: 1,
    };
  },
  created() {
    this.getData();
  },
  mounted() {},
  watch: {
    // 监听当前选择的时间
    currentTime() {
      this.allTimeMethods();
    },
    // 监听主要内容数据
    mainDataList(val) {
      if (val.length === 0) {
        this.mainDataYes = false;
        return;
      }
      this.mainDataYes = true;
    },
    // 监听激活的时长
    durationActive() {
      this.promptMessage();
    },
    partitionActive() {
      this.promptMessage();
    },
  },
  methods: {
    tabsClick() {
      console.log("点击了tabs栏");
    },
    // 获取内容数据
    async getData() {
      // let searchData = this.$lodash.cloneDeep(this.searchInput);
      const { data: res } = await this.$axiosbili({
        // url: `/bbsearch/x/web-interface/search/type?keyword=${this.searchInput}&search_type=video&page=${this.currentPage}&order=${this.currentOrder}`,
        url: "/bbsearch/x/web-interface/search/type",
        method: "get",
        params: {
          keyword: this.searchInput,
          search_type: "video",
          page: this.currentPage,
          order: this.currentOrder,
        },
      });
      // 如果请求失败 对象中就没有 result 这个属性
      if (res.code === -400 || res.data.result === undefined) {
        this.mainDataYes = false;
        return;
      }

      this.mainDataYes = true;
      this.mainDataList = res.data.result;
      this.mainDataListCopy = res.data.result;
      // 格式化获取的时间
      this.formatTime();
    },
    // 格式化获取的时间
    formatTime() {
      let arr = this.$lodash.cloneDeep(this.mainDataListCopy);
      // 将时间转化为秒
      arr = this.changeSeconds(arr);
      // 将时间格式化
      arr = this.formatSeconds(arr);
      this.mainDataList = this.$lodash.cloneDeep(arr);
    },
    // 确定搜索
    searchConfirm() {
      this.getData();
      // 修改地址栏
      let query = this.$router.history.current.query;
      let path = this.$router.history.current.path;
      // 对象深拷贝
      let newQuery = this.$lodash.cloneDeep(query);
      // 地址栏的参数重新赋值
      newQuery.keyword = this.searchInput;
      this.$router.push({ path, query: newQuery });
    },
    // 排序发生改变
    orderChange(val) {
      switch (val) {
        case "综合排序":
          this.currentOrder = "default";
          break;
        case "最多点击":
          this.currentOrder = "click";
          break;
        case "最新发布":
          this.currentOrder = "pubdate";
          break;
        case "最多弹幕":
          this.currentOrder = "damku";
          break;
        case "最多收藏":
          this.currentOrder = "stow";
          break;
      }
      this.getData();
    },
    // 综合排序的方法（得分最高）最多点击等其他同理
    /* comprehensiveSort() {
      // sort 不传参就是按照字符编码的顺序进行排序
      // 提供比较函数，该函数要比较两个值
      // obj1 小于 obj2，在排序后的数组中 obj1 应该出现在 obj2 之前 返回一个小于 0 的值
      // 1.0 没有分页时 直接对数据进行排序
      this.mainDataList.sort((obj1, obj2) => {
        return obj2.rank_score - obj1.rank_score;
      });
    }, */

    // 点击tab栏时间的方法
    allTimeMethods() {
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

    // 将接口中时间（3:23）转变为秒的方法
    changeSeconds(arr) {
      arr.forEach((value, index, array) => {
        let t = array[index].duration.split(":");
        array[index].duration = t[0] * 60 + parseInt(t[1]);
      });
      return arr;
    },
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
          s = s < 10 ? "0" + s : s;
          timeFormat = timeFormat + s;
          return;
        } else {
          let m = Math.floor(time / 60);
          m = m < 10 ? "0" + m : m;
          timeFormat = timeFormat + m + ":";
          allTime(time - m * 60);
        }
      }
      return arr2;
    },
    // 分区弹出框显示前 判断此刻是不是全部分区
    popoverShow(index) {
      if (index === 0) {
        this.partitionList[index].pvisible = false;
        return;
      }
    },
    // 分区弹出框隐藏后 index 清空
    popoverHide(index) {
      if (this.partitionList[index].index === undefined) {
        return;
      }
      this.partitionList[index].index = null;
    },
    // 分区被点击了
    partitionClick(i, item) {
      // 对话框的显示与隐藏
      this.partitionList.forEach((value, index) => {
        if (index === i) {
          this.partitionList[index].pvisible = true;
        } else {
          this.partitionList[index].pvisible = false;
        }
      });
      // 点击了全部分区
      if (i === 0) {
        this.mainDataList = this.$lodash.cloneDeep(this.mainDataListCopy);
        return;
      }
      // 处理其他分区数据
      let arr = this.$lodash.cloneDeep(this.mainDataListCopy);
      let arr2 = [];
      // 从所有数据中 筛选出符合点击的分区的内容
      // item 就是传入的分区
      arr.forEach((value) => {
        if (item.indexOf(value.typename) >= 0) {
          arr2.push(value);
        }
      });
      this.mainDataList = this.$lodash.cloneDeep(arr2);
    },
    // 分区里面的对话框被点击了
    partitionItemClick(e, item) {
      // 防止点击两次
      // 因为原生click事件会执行两次，第一次在label标签上，
      // 第二次在input标签上，故此处理
      if (e.target.tagName === "INPUT") return;
      this.promptMessage();
      let arr = this.$lodash.cloneDeep(this.mainDataListCopy);
      let arr2 = [];
      arr.forEach((value) => {
        if (value.typename === item) {
          arr2.push(value);
        }
      });
      this.mainDataList = this.$lodash.cloneDeep(arr2);
    },
    // 折叠区域的改变
    foldChange() {
      this.partitionList.forEach((value, i) => {
        this.partitionList[i].pvisible = false;
      });
    },
    // 当前页发生改变
    handleCurrentChange(val) {
      this.currentPage = val;
      this.getData();
    },

    // 提示信息
    promptMessage() {
      this.$message({
        // 可关闭
        showClose: true,
        message: "由于数据问题，仅对当前页有效噢!",
        type: "warning",
        // 持续时间
        duration: "1500",
      });
    },
    // 鼠标事件
    enter(i) {
      this.currentIndex = i;
    },
    leave() {
      this.currentIndex = null;
    },
  },
};
</script>

<style scoped>
.search {
  min-width: 1090px;
}
.search_header {
  background-image: linear-gradient(
    rgba(12, 73, 153, 0.7),
    rgba(163, 186, 250, 0.4)
  );
}
.search_main {
  margin: 0 auto;
  width: 980px;
}
.head-contain {
  padding-top: 40px;
}
.search-wrap {
  display: flex;
  width: 60%;
  margin: 0 auto;
}
.s-logo {
  width: 140px;
  height: 40px;
}
.s-logo img {
  width: 100%;
}
.s-inp {
  flex: 1;
  margin: 0 10px;
}
.s-btn {
  width: 90px;
  height: 40px;
}
.search_btn {
  position: relative;
  width: 100%;
  height: 100%;
  line-height: 100%;
  font-size: 16px;
  padding: 0;
}
.search_logo {
  position: absolute;
  left: 5px;
  top: 11px;
  font-size: 36px;
}
.search_title {
  margin-left: 20px;
}

/* tab栏 */
.el-tabs {
  margin-top: 20px;
}

/* 折叠区域 */
.el-collapse {
  border: 0;
}
.allpartition {
  margin-top: 10px;
}
/* 分区 */
.partition-item {
  margin-right: 4px;
}

/* 视频内容 */
.video-list {
  display: flex;
  flex-wrap: wrap;
}
.main-data-item {
  margin-top: 20px;
  margin-right: 25px;
}
.main-data-item:nth-child(5n) {
  margin-right: 0;
}
.video-list-no {
  margin: 50px;
  text-align: center;
}

/* 鼠标移进来添加的类名 */
.item-hover {
  background: rgba(223, 223, 223, 0.3);
}

/* 分页 */
.el-pagination {
  margin-top: 40px;
  text-align: center;
  background: "#00a1d6";
}

/* 底部 */
.home-footer {
  margin-top: 50px;
}

/* 回到顶部 */
.backtop-main img {
  width: 120%;
}
</style>