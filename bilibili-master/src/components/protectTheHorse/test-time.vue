<template>
  <div class="page-test">
    <div class="row">
      <span class="col">计时</span>
      <span class="col">剩余ms</span>
      <span class="col">操作</span>
    </div>
    <div class="row" v-for="({id, isPause, time, remain}, index) in timeArr" :key="id">
      <span class="col">{{time}}</span>
      <span class="col">{{remain}}</span>
      <span class="col">
        <el-button size="mini" @click="btnClick(index)">{{isPause ? '开始' : '暂停'}}</el-button>
        <el-button size="mini" @click="deleteTimer(index)">销毁</el-button>
      </span>
    </div>
    <div class="row">
      <el-button size="mini" @click="start()">全部开始/暂停</el-button>
      <el-button size="mini" @click="clear()">全部销毁</el-button>
    </div>
  </div>
</template>

<script>
import keepInterval from './utils/keepInterval'

export default {
  data() {
    return {
      timeArr: [
        {id: 1, isPause: true, time: 0, remain: 0},
        {id: 2, isPause: true, time: 0, remain: 0},
        {id: 3, isPause: true, time: 0, remain: 0},
        {id: 4, isPause: true, time: 0, remain: 0},
      ]
    }
  },
  methods: {
    btnClick(i) {
      this.timeArr[i].isPause = !this.timeArr[i].isPause
      const id = this.timeArr[i].id
      if(!this.timeArr[i].isPause) {
        keepInterval.set(id, () => {
          console.log(`id: ${this.timeArr[i].id}`);
          this.timeArr[i].time += 2
        }, 2000)
      } else {
        this.timeArr[i].remain = 2000 - keepInterval.pause(id)
      }
    },
    deleteTimer(i) {
      keepInterval.delete(this.timeArr[i].id)
    },
    start() {
      this.timeArr.forEach((item, i) => {
        this.btnClick(i)
      })
    },
    clear() {
      keepInterval.clear()
    }
  }
}
</script>

<style lang="less" scoped>
.page-test {
  padding: 30px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  .row {
    width: 500px;
    height: 60px;
    padding: 0 20px;
    display: flex;
    justify-content: space-between;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    .col {
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
}
</style>
