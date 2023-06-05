<template>
  <div v-if="isShow" class="com-advertising" @click="$router.push('/protectTheHorse')">
    <img class="bg" src="@/components/protectTheHorse/assets/img/horse1.png" alt="">
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
.com-advertising {
  position: fixed;
  bottom: 0;
  right: 0;
  .bg {
    height: 100px;
  }
  .iconfont {
    position: absolute;
    top: 0;
    right: 0;
    font-size: 26px;
    color: #fff;
    background: rgba(0, 0, 0, .3);
    cursor: pointer;
    border-bottom-left-radius: 8px;
  }
}
</style>