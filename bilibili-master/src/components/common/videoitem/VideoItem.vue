<template>
  <div class="video-item">
    <a :href="mainData.arcurl">
      <div class="v-i-pic">
        <!-- 3.图片懒加载修改img :src -> v-lazy -->
        <img v-lazy="mainData.pic" alt="" />
        <span>{{ mainData.duration }}</span>
      </div>
      <!-- 解析数据中的html标签 -->
      <div class="v-i-title" v-html="mainData.title">
        {{ mainData.title }}
      </div>
      <!-- 标签 -->
      <div class="tags">
        <span class="tags-watch">
          <i class="iconfont icon-bofangliang1"></i>
          {{ tenThousand(mainData.play) }}
        </span>
        <span class="tags-date">
          <i class="iconfont icon-history"></i>
          {{ dateTransform(mainData.pubdate) }}
        </span>
      </div>
      <!-- up主 -->
      <div class="b-up">
        <i class="iconfont icon-bilibili-fill"></i>
        {{ mainData.author }}
      </div>
    </a>
  </div>
</template>

<script>
export default {
  name: "video-item",
  props: {
    mainData: {
      type: Object,
      default() {
        return {};
      },
    },
  },
  data() {
    return {};
  },
  computed: {
    // 计算数量过万就转换
    tenThousand() {
      // 计算属性是一个属性不是一个方法, 使用函数返回
      return (count) => {
        if (count >= 100000000) {
          return (count / 100000000).toFixed(1) + "亿";
        }
        return count >= 10000 ? (count / 10000).toFixed(1) + "万" : count;
      };
    },

    // 日期格式转换
    dateTransform() {
      return (date) => {
        const da = new Date(date * 1000);
        let year = da.getFullYear();
        let month = da.getMonth() + 1;
        month = month < 10 ? "0" + month : month;
        let day = da.getDate();
        day = day < 10 ? "0" + day : day;

        return year + "-" + month + "-" + day;
      };
    },
  },
  methods: {},
};
</script>

<style scoped>
.video-item {
  box-sizing: border-box;
  width: 175px;
  height: 210px;
  border: 1px solid #e5e9ef;
  border-radius: 6px;
  overflow: hidden;
  font: 12px Helvetica Neue, Helvetica, Arial, Microsoft Yahei, Hiragino Sans GB,
    Heiti SC, WenQuanYi Micro Hei, sans-serif;
}
.v-i-pic {
  position: relative;
  overflow: hidden;
  max-height: 100px;
}
.v-i-pic img {
  display: block;
  /* width: calc(100% + 1px); */
  width: 100%;
}
.v-i-pic span {
  position: absolute;
  bottom: 0;
  right: -1px;
  padding: 2px 4px;
  background: rgba(0, 0, 0, 0.5);
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
  color: #fff;
}
.v-i-title {
  margin: 8px 10px;
  color: #414141;
  /* 字间距 */
  letter-spacing: 1px;
  /* 行间距 */
  line-height: 20px;
  height: 40px;
  /* 2行显示 */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
.v-i-title:hover {
  color: #52aae2;
}
.tags {
  margin: 0 10px;
  color: #99a2aa;
}
.b-up {
  margin: 8px 10px 0;
  color: #99a2aa;
}
</style>