<template>
  <div class="com-skill">
    <!-- 游戏底部技能区 -->
    <div class="skill-wrap">
      <span v-for="(item, index) in skillList" :key="index">
        <el-tooltip effect="dark" placement="top">
          <div slot="content" class="com-skill-tooltip">
            <div class="skill-name">{{item.name}}</div>
            <div>{{item.instructions}}</div>
            <div>金额：{{item.money}} cd：{{item.cd / 1000}}秒</div>
          </div>
          <span class="skill-item">
            <span class="skill iconfont" :class="item.icon" @click="!isDisable(item.money) && $emit('handleSkill', index)"></span>
            <span v-show="isDisable(item.money)" class="skill-disable iconfont icon-disablecase"></span>
            <span v-show="item.curTime" class="skill-disable skill-time">{{item.curTime / 1000}}</span>
          </span>
        </el-tooltip>
      </span>
    </div>
    <!-- 技能: 肉弹冲击 -->
    <div v-if="skillList[0].isShow" class="skill-boom"></div>
    <!-- 技能: 肉弹冲击 -->
    <img v-if="skillList[1].isShow" class="skill-rush" src="../assets/img/meat-rush.png" alt="">
  </div>
</template>

<script>
export default {
  name: 'skill',
  props: {
    skillList: {
      type: Array,
      default: () => []
    },
    money: {
      type: Number,
      default: 0
    },
    isPause: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    isDisable() {
      return (money) => {
        return this.money < money || this.isPause
      }
    }
  }
}
</script>
<style lang='less' scoped>
.com-skill {
  .skill-wrap {
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    align-items: center;
    height: calc(@size - 2px);
    background: #d2f5fa;
    box-shadow: 3px -2px 14px 2px #0e80c7;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
    padding: 0 20px;
    user-select: none;
    .skill-item {
      @smallSize: calc(@size * 0.8);
      @fontSize: calc(@size * 0.64);
      position: relative;
      margin-right: 15px;
      border-radius: 8px;
      display: inline-block;
      width: @smallSize;
      height: @smallSize;
      text-align: center;
      line-height: @smallSize;
      cursor: pointer;
      &:hover {
        background: rgba(216, 216, 216, 0.4);
      }
      .skill {
        font-size: @fontSize;
        color: #5bb3e5;
        &:hover {
          color: #157ab5;
        }
      }
      .skill-disable {
        position: absolute;
        left: 0;
        top: 0;
        bottom: 0;
        right: 0;
        font-size: @fontSize;
        color: rgba(85, 174, 247, 0.5);
        background: rgba(216, 216, 216, 0.3);
        border-radius: 50%;
      }
      .skill-time {
        color: #888;
        font-weight: bold;
      }
    }
  }
  @boomSize: calc(@size * 80);
  .skill-boom {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 1;
    transform: translate(-50%, -50%);
    width: calc(@size * 8);
    height: calc(@size * 8);
    background: url(../assets/img/boom.png) no-repeat;
    background-size: @boomSize 100%;
    background-position: 0 0;
    animation: skill-boom 1.5s steps(10) forwards;
  }
  @keyframes skill-boom {
    0% {
      background-position: 0 0;
    }
    90% {
      background-position: calc(@boomSize * -1) 0;
    }
    100% {
      background-position: calc(@boomSize * -1) 0;
      display: none;
    }
  }
  .skill-rush {
    position: absolute;
    top: 50%;
    z-index: 1;
    transform: translate(-50%, -50%);
    width: calc(@size * 10);
    animation: skill-rush 2s linear forwards;
  }
  @keyframes skill-rush {
    0% {
      left: 0;
    }
    25% {
      left: 50%;
    }
    75% {
      left: 55%;
    }
    100% {
      left: 150%;
    }
  }
}
.com-skill-tooltip {
  max-width: 130px;
  text-align: center;
  font-size: 12px;
  .skill-name {
    font-weight: bold;
    font-size: 14px;
  }
  div {
    white-space: pre-wrap;
    margin-bottom: 3px;
  }
}
</style>