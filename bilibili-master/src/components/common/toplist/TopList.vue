<template>
  <div class="toplist">
    <header class="t-header">
      <span class="t-h-name">排行榜</span>
      <span class="more">
        <a href="javascript:;">
          更多
          <i class="iconfont icon-arrow-right"></i>
        </a>
      </span>
    </header>
    <div v-for="(item, index) in Topdata" :key="index" class="toplist-item">
      <i class="t-i-number">{{ index + 1 }}</i>
      <a href="javajcript:;" @click="jumpPath(item.title)">
        <div class="t-i-tilte">
          <span>{{ item.title }}</span>
        </div>
      </a>
    </div>
  </div>
</template>

<script>
export default {
  name: "TopList",
  props: {
    maindata: {
      type: Array,
      default() {
        return [];
      },
    },
  },
  data() {
    return {
      // 排序后的值
      Topdata: [],
    };
  },
  watch: {
    // 解决取不到值的问题
    // 监听到 maindata 获取到值了 再给 this.Topdata
    maindata(val) {
      // JSON.parse(JSON.stringify(val))
      this.Topdata = this.dataSort(val);
    },
  },
  methods: {
    // 将数据按播放量进行排序
    dataSort(arr) {
      let arrs = [];
      for (let i in arr) {
        arrs.push(arr[i]);
      }
      arrs.sort((obj1, obj2) => {
        let val1 = obj1.stat.view;
        let val2 = obj2.stat.view;
        return val2 - val1;
        /* if (val1 < val2) {
          return 1;
        } else if (val1 > val2) {
          return -1;
        } else {
          return 0;
        } */
      });
      return arrs;
    },

    // 点击跳转
    jumpPath(keyword) {
      this.$router.push(`/search?keyword=${keyword}`);
    },
  },
};
</script>

<style scoped>
.toplist {
  width: 100%;
  padding: 0 10px 0 20px;
}
.t-header {
  display: flex;
  justify-content: space-between;
  padding: 10px;
}
.t-h-name {
  font-size: 18px;
}
.more {
  padding: 2px 5px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 14px;
}

.toplist-item {
  justify-content: space-around;
  width: 100%;
  padding: 8px;
}

.t-i-number {
  display: inline-block;
  width: 10%;
  height: 20px;
  margin-right: 5%;
  font-size: 14px;
  color: #999;
  text-align: center;
}

.t-i-tilte {
  display: inline-block;
  width: 85%;
  font-size: 14px;
  /* 垂直对齐  父级要变*/
  vertical-align: middle;
}
.t-i-tilte span {
  /* 两行显示 */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
  overflow: hidden;
  color: #4d4d4d;
}
</style>