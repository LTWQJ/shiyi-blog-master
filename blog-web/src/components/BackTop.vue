<template>
  <div class="rightside" :style="isShow">
    <div :class="'rightside-config-hide ' + isOut">
      <div  @click="fllowclose" v-show="this.see==true" >
        <svg t="1684743745901" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2287" width="27" height="27"><path d="M512 205.158566c-222.884276 0-416.184771 124.58446-511.978511 306.84348 95.79374 182.254927 289.095257 306.84041 511.978511 306.84041s416.184771-124.58446 511.978511-306.84041C928.184771 329.743026 734.883253 205.158566 512 205.158566zM512 717.237361c-115.177206 0-208.543663-91.88778-208.543663-205.235314 0-113.350604 93.367481-205.238384 208.543663-205.238384 115.174136 0 208.541617 91.88778 208.541617 205.238384C720.540593 625.348558 627.174136 717.237361 512 717.237361z" fill="#1296db" p-id="2288"></path></svg>
      </div>
      <div  @click="fllowclose" v-show="this.see==false" >
        <svg t="1684399666024" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2259" width="27" height="27"><path d="M149.504 722.432l199.68-196.608c-0.512-6.144-1.024-12.288-1.024-18.432 0-89.088 72.704-161.792 161.792-161.792 7.168 0 13.824 0.512 20.48 1.536L689.664 189.44c-57.856-18.944-117.248-29.184-175.616-29.184-174.592 0-359.936 91.136-466.944 235.52-47.104 63.488-47.104 158.208 0 221.696 28.672 38.912 63.488 74.24 102.4 104.96zM980.992 395.264c-31.744-43.52-71.168-81.92-115.2-114.688l-197.12 194.56c2.048 10.24 3.072 20.992 3.072 31.744 0 89.088-72.704 161.792-161.792 161.792-11.776 0-23.04-1.024-34.304-3.584l-154.624 152.576c60.928 22.016 124.928 34.304 187.904 34.304 174.592 0 365.056-91.136 472.064-235.52 47.104-62.976 47.104-157.184 0-221.184zM919.552 92.672c-22.016-22.016-57.856-22.016-79.872 0L90.624 841.728c-22.016 22.016-22.016 57.856 0 79.872 22.016 22.016 57.856 22.016 79.872 0L919.552 172.032c21.504-22.016 21.504-57.856 0-79.36z" fill="#1296db" p-id="2260"></path></svg>
      </div>
      <i :class="'iconfont rightside-icon ' + icon" @click="check" />
    </div>
    <div class="setting-container" @click="show">
      <i class="iconfont iconshezhi setting" />
    </div>
    <div @click="openFeedback" class="setting-container">
      <img title="反馈" style="width: 22px;height: 22px;margin-top: 3px" src="http://img.shiyit.com/fankui_1.png" />
    </div>
    <i @click="backTop" class="iconfont rightside-icon iconziyuanldpi" />
  </div>
</template>

<script>
import {stopp} from "@/assets/js/fullScreenFlower";
export default {
  created() {
    this.$vuetify.theme.dark = !this.$vuetify.theme.dark;
    },

  mounted() {

    window.addEventListener("scroll", this.scrollToTop);
  },
  destroyed() {
    window.removeEventListener("scroll", this.scrollToTop);
  },
  data: function() {
    return {
      isShow: "",
      isOut: "rightside-out",
      icon: "iconyueliang",
      see:true,
    };
  },
  methods: {
    fllowclose(){
      if( this.see==true){
        this.see=false
      }
      else {
        this.see=true
      }
      stopp();
    },
    openFeedback(){
      this.$store.commit("setDialogFormVisible");
    },
    // 回到顶部方法
    backTop() {
      window.scrollTo({
        behavior: "smooth",
        top: 0
      });
    },
    // 为了计算距离顶部的高度，当高度大于100显示回顶部图标，小于100则隐藏
    scrollToTop() {
      const that = this;
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      that.scrollTop = scrollTop;
      if (that.scrollTop > 20) {
        that.isShow = "opacity: 1;transform: translateX(-38px);";
      } else {
        that.isShow = "";
      }
    },
    show() {
      const flag = this.isOut == "rightside-out";
      this.isOut = flag ? "rightside-in" : "rightside-out";
    },
    check() {
      const flag = this.icon == "iconyueliang";
      this.icon = flag ? "icontaiyang" : "iconyueliang";
      this.$vuetify.theme.dark = !this.$vuetify.theme.dark;
    },
  }
};
</script>

<style scoped>
.rightside {
  z-index: 4;
  position: fixed;
  right: -38px;
  bottom: 85px;
  transition: all 0.5s;
}
.rightside-config-hide {
  transform: translate(35px, 0);
}
.rightside-out {
  animation: rightsideOut 0.3s;
}
.rightside-in {
  transform: translate(0, 0) !important;
  animation: rightsideIn 0.3s;
}
.rightside-icon,
.setting-container {
  display: block;
  margin-bottom: 2px;
  width: 30px;
  height: 30px;
  background-color: #49b1f5;
  color: #fff;
  text-align: center;
  font-size: 16px;
  line-height: 30px;
  cursor: pointer;
}
.rightside-icon:hover,
.setting-container:hover {
  background-color: #ff7242;
}
.setting-container i {
  display: block;
  animation: turn-around 2s linear infinite;
}
@keyframes turn-around {
  0% {
    transform: rotate(0);
  }
  100% {
    transform: rotate(360deg);
  }
}
@keyframes rightsideOut {
  0% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(30px, 0);
  }
}
@keyframes rightsideIn {
  0% {
    transform: translate(30px, 0);
  }
  100% {
    transform: translate(0, 0);
  }
}
</style>
