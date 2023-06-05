<template>
  <div class="card-list">
    <!-- 楼层标题 -->
    <header class="storey-title">
      <div class="s-t-left">
        <i class="iconfont icon-donghua"></i>
        <div>{{ getName() }}</div>
      </div>
      <div class="s-t-right">
        <div class="btn-change">
          <i class="iconfont icon-huanyihuan"></i>
          <span @click="changeIt">&nbsp;换一换</span>
        </div>
        <div class="more">
          <a href="javascript:;">
            更多
            <i class="iconfont icon-arrow-right"></i>
          </a>
        </div>
      </div>
    </header>
    <!-- 楼层内容 -->
    <div class="storey-content">
      <div
        class="s-c-item"
        v-for="(item, i) in maindataItem"
        :key="i"
        @click="jumpPath(item.title)"
      >
        <!-- 图片 -->
        <div class="item-pic">
          <!-- 3.图片懒加载修改img :src -> v-lazy -->
          <img v-lazy="item.pic" alt="" />
          <div class="count">
            <i class="iconfont icon-bofangliang1"></i>
            {{ tenThousand(item.stat.view) }}
            <i class="iconfont icon-dianzan"></i>
            {{ tenThousand(item.stat.like) }}
            <i class="iconfont icon-jinbi"></i>
            {{ tenThousand(item.stat.coin) }}
          </div>
          <div class="duration">
            {{ timeHandle(item.duration) }}
          </div>
        </div>
        <!-- 标题 -->
        <div class="item-title">
          <a href="#">{{ item.title }}</a>
        </div>
        <!-- up主 -->
        <div class="item-up">
          <a href="#">
            <i class="iconfont icon-icon_bilibili-circle"></i>
            {{ item.owner.name }}
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CardList",
  props: {
    maindataItem: {
      type: Array,
      default() {
        return [];
      },
    },
    mdnameItem: {
      type: String,
      default: "",
    },
  },
  data() {
    return {};
  },
  created() {},
  mouthed() {
    this.getName();
  },
  computed: {
    // 计算数量过万就转换
    tenThousand() {
      // 计算属性是一个属性不是一个方法, 使用函数返回
      return function (count) {
        if (count >= 100000000) {
          return (count / 100000000).toFixed(1) + "亿";
        }
        return count >= 10000 ? (count / 10000).toFixed(1) + "万" : count;
      };
    },
  },
  methods: {
    // 获取标题名字
    getName() {
      // 如果 this.maindataItem 里面有 tname 这个属性就 return ture取反(false)
      // every() 如果数组中检测到有一个元素不满足，则整个表达式返回 false ，且剩余的元素不会再进行检测。
      if (this.maindataItem.every((item) => !("tname" in item))) {
        return;
      }
      return this.maindataItem[0].tname;
    },

    // 点击换一换
    changeIt() {
      // 事件总线 发射:this.$bus.$emit('aaaa')  接收:this.$bus.$on('aaaa',function)
      this.$bus.$emit("changeList", this.mdnameItem);
    },

    // 处理时间
    timeHandle(time) {
      let timeFormat = "";
      function allTime(time) {
        if (time < 60) {
          let s = time > 0 ? time : "";
          s = s <= 10 ? "0" + s : s;
          timeFormat = timeFormat + s;
          return;
        } else if (time < 3600) {
          let m = Math.floor(time / 60);
          m = m <= 10 ? "0" + m : m;
          timeFormat = timeFormat + m + ":";
          allTime(time - m * 60);
        } else {
          let h = Math.floor(time / 3600);
          h = h <= 10 ? "0" + h : h;
          timeFormat = timeFormat + h + ":";
          allTime(time - h * 3600);
        }
      }
      allTime(time);
      return timeFormat;
    },

    // 点击跳转
    jumpPath(keyword) {
      this.$router.push(`/search?keyword=${keyword}`);
    },
  },
};
</script>

<style scoped>
.card-list {
  width: 100%;
  font: 12px Helvetica Neue, Helvetica, Arial, Microsoft Yahei, Hiragino Sans GB,
    Heiti SC, WenQuanYi Micro Hei, sans-serif;
}
/* 楼层标题区域 */
.storey-title {
  padding: 10px;
  display: flex;
  justify-content: space-between;
}
.s-t-left {
  display: flex;
  align-items: center;
  font-size: 20px;
  cursor: pointer;
}
.s-t-left i {
  font-size: 28px;
  color: #7b78eb;
  margin-right: 8px;
}
.s-t-right {
  display: flex;
  justify-content: space-around;
  align-items: center;
  text-align: center;
  width: 15%;
  font-size: 12px;
}
.s-t-right .btn-change {
  flex: 1;
  margin-right: 5px;
  padding: 2px 5px;
  border-radius: 5px;
  border: 1px solid #ccc;
  cursor: pointer;
}
.btn-change:hover {
  background: #f5f5f5;
}
.s-t-right .more {
  padding: 2px 5px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

/* 楼层内容区域 */
.storey-content {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}
.s-c-item {
  width: 19%;
  margin-bottom: 10px;
}
.item-pic {
  position: relative;
  width: 100%;
  max-height: 116px;
  border-radius: 5px;
  overflow: hidden;
  /* box-shadow: 0 0 5px rgba(0, 0, 0, 0.2); */
}
.item-pic img {
  display: block;
  width: 100%;
}
.item-pic .count {
  position: absolute;
  left: 0;
  bottom: 0;
  font-size: 12px;
  padding: 3px 5px;
  color: #fff;
  background-image: linear-gradient(
    to top,
    rgba(0, 0, 0, 0.6),
    rgba(119, 119, 119, 0.1)
  );
  width: 100%;
  /* 一行显示 */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
  overflow: hidden;
}
.duration {
  position: absolute;
  right: 0;
  top: 0;
  padding: 3px 5px;
  color: #fff;
  background-image: linear-gradient(
    to left bottom,
    rgba(0, 0, 0, 0.6),
    rgba(255, 255, 255, 0.1)
  );
  border-bottom-left-radius: 8px;
}

.item-title {
  height: 21%;
  margin-top: 5px;
  margin-bottom: 10px;
  font-size: 14px;
  /* 两行显示 */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
  color: #4d4d4d;
}
.item-up {
  padding-left: 5px;
}
.item-up a {
  font-size: 12px;
  color: #999;
}
</style>