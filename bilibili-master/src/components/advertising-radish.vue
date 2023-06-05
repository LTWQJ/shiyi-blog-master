<template>
  <div v-if="isShow" class="com-advertising-radish" @click="$router.push('/protectRadish')">
    <img class="bg" src="@/components/protectTheHorse/assets/img/terminal.png" alt="">
    <div class="text">保卫萝卜4(低配版)</div>
    <i class="iconfont icon-close" @click="close"></i>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isShow: true
    }
  },
  methods: {
    close(e) {
      e.stopPropagation()
      this.isShow = false
    }
  }
}
</script>

<style lang="less" scoped>
.com-advertising-radish {
  position: fixed;
  bottom: 50%;
  right: 0;
  text-align: center;
  cursor: pointer;
  .bg {
    height: 100px;
  }
  .text {
    font-size: 13px;
    color: #fff;
    background: rgba(0, 0, 0, .3);
    padding: 2px 6px;
    border-radius: 3px;
  }
  .iconfont {
    position: absolute;
    top: 0;
    right: 0;
    font-size: 26px;
    color: #fff;
    background: rgba(0, 0, 0, .3);
    border-bottom-left-radius: 8px;
  }
}
</style>