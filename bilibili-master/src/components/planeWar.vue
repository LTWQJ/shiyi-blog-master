<template>
  <div class="page-planeWar">
  <div v-if="!playState" class="playgame">BUG大战点击飞机开始游戏</div>
    <img
      ref="mouseImg"
      class="mouse-img"
      :class="mouseMove"
      src="../assets/img/plane.png"
      @click="getMouse"
      @dblclick="clearAll"
    />
    <!-- 子弹 -->
    <span
      class="bullet"
      v-for="(item, index) in allBullet"
      :key="index"
      :style="{ top: item.y + 'px', left: item.x + 'px' }"
    ></span>
    <!-- 敌人 -->
    <img
      src="../assets/img/bug.png"
      class="enemy"
      v-for="(item, index) in allEnemy"
      :key="index + 4399"
      :style="{ top: item.y + 'px', left: item.x + 'px' }"
    />
    <!-- 得分 -->
    <span v-if="playState" class="score">已消灭BUG: {{ score }}</span>
    <span v-if="playState" class="bugnum">新产生BUG: {{ bugNum }}</span>
  </div>
</template>

<script>
export default {
  name: "planewar",
  data() {
    return {
      // 游戏状态
      playState: false,
      // 子弹
      allBullet: [],
      // 子弹速度
      bulletSpeed: 5,
      // 子弹发射的时间间隔
      bulletMoveTime: 400,
      // 子弹计时器
      bulletTimer: null,
      // 子弹数量计时器
      bulletNumTimer: null,
      // 臭虫
      allEnemy: [],
      // 臭虫速度
      enemySpeed: 3,
      // 臭虫的出现间隔时间
      enemyComeTime: 1200,
      // 敌人计时器
      enemyTimer: null,
      // 敌人数量计时器
      enemyNumTimer: null,
      // 鼠标对象
      mouseEvent: { x: 0, y: 0 },
      // 顶部的位置 navbar
      topPosition: 56,
      // 浏览器窗口宽度高度
      windowWidth: 0,
      windowHeight: 0,
      // 取消上次延时未执行的方法，用于点击事件和双击
      clickTime: null,
      // 窗口变化的防抖
      windowTime: null,
      // 得分
      score: 0,
      // 新产生的 bug 数
      bugNum: 0,
    };
  },
  watch: {
    // 监听游戏开始状态
    playState(val) {
      if (!val) {
        this.stopBulletShot();
      }
    },
    // 监听子弹的位置变化
    allBullet: {
      handler: function (e) {
        if (e[0] && e[0].y && e[0].y <= this.topPosition) {
          // console.log(0 + ":到顶了");
          e.splice(0, 1);
          this.bulletMove();
        }
      },
      // 使用deep属性，如果对象内发生了变化就会触发该方法
      deep: true,
    },
    // 监听臭虫的位置变化
    allEnemy: {
      handler: function (e) {
        if (e[0] && e[0].y && e[0].y >= this.windowHeight) {
          e.splice(0, 1);
          this.enemyCome();
          this.bugNum++;
        }
        // 遍历如果子弹和触碰到臭虫就销毁
        e.forEach((item, i, arr) => {
          this.allBullet.forEach((item2, i2, arr2) => {
            if (
              item2.y >= item.y &&
              item2.y <= item.y + 30 &&
              item2.x >= item.x &&
              item2.x <= item.x + 30
            ) {
              arr.splice(i, 1);
              arr2.splice(i2, 1);
              this.score += 1;
            }
          });
        });
      },
      deep: true,
    },
  },
  created() {
    this.windowWidth = document.documentElement.clientWidth;
    this.windowHeight = document.documentElement.clientHeight;
  },
  mounted() {
    let that = this;
    // 监听浏览器窗口大小变化
    window.addEventListener("resize", function () {
      clearTimeout(this.windowTime);
      this.windowTime = setTimeout(() => {
        that.windowWidth = document.documentElement.clientWidth;
        that.windowHeight = document.documentElement.clientHeight;
      }, 200);
    });
  },
  methods: {
    // 点击判断是否是游戏状态
    getMouse() {
      clearTimeout(this.clickTime);
      let event = window.event;
      this.clickTime = setTimeout(() => {
        if (!this.playState) {
          this.promptMessage();
          // 获取开始时候的子弹位置
          this.mouseEvent.x = event.pageX;
          this.mouseEvent.y = event.pageY;
          this.addBullet();
          this.addEnemy();

          // 添加飞机跟随鼠标移动事件
          document.addEventListener("mousemove", this.mouseMove);

          // 开启增加子弹、增加敌人定时器
          this.addBulletNumTimer();
          this.addEnemyNumTimer();

          this.playState = true;
        } else {
          // 移除飞机跟随鼠标移动事件
          document.removeEventListener("mousemove", this.mouseMove, false);
          this.playState = false;
        }
      }, 200);
    },
    // 控制鼠标移动
    mouseMove(e) {
      // window.event.pageX
      this.mouseEvent.x = e.pageX;
      this.mouseEvent.y = e.pageY;

      this.$refs.mouseImg.style.left = e.pageX - 25 + "px";
      this.$refs.mouseImg.style.top = e.pageY - 25 + "px";
    },
    // 添加子弹
    addBullet() {
      this.allBullet.push({
        x: this.mouseEvent.x - 1,
        y: this.mouseEvent.y - this.bulletSpeed - 30,
      });
      this.bulletMove();
    },
    // 添加敌人
    addEnemy() {
      // 生产一个在窗口范围内的整数
      let x = Math.round(Math.random() * this.windowWidth);
      this.allEnemy.push({
        x: x,
        y: this.topPosition,
      });
      this.enemyCome();
    },
    // 子弹移动计时器
    bulletMove() {
      clearInterval(this.bulletTimer);
      this.bulletTimer = setInterval(() => {
        this.allBullet.forEach((item, index, arr) => {
          arr[index].y -= this.bulletSpeed;
        });
      }, 50);
    },
    // 添加子弹计时器
    addBulletNumTimer() {
      this.bulletNumTimer = setInterval(() => {
        this.addBullet();
      }, this.bulletMoveTime);
    },

    /**
     * 敌人来了
     * */
    enemyCome() {
      clearInterval(this.enemyTimer);
      this.enemyTimer = setInterval(() => {
        this.allEnemy.forEach((item, index, arr) => {
          arr[index].y += this.enemySpeed;
        });
      }, 50);
    },
    // 添加敌人计时器
    addEnemyNumTimer() {
      this.enemyNumTimer = setInterval(() => {
        this.addEnemy();
      }, this.enemyComeTime);
    },
    // 停止子弹射击
    stopBulletShot() {
      clearInterval(this.bulletTimer);
      clearInterval(this.bulletNumTimer);
      clearInterval(this.enemyTimer);
      clearInterval(this.enemyNumTimer);
    },
    // 双击重新开始
    clearAll() {
      clearTimeout(this.clickTime);
      this.clickTime = setTimeout(() => {
        this.stopBulletShot();
        this.allBullet = [];
        this.allEnemy = [];
        this.playState = false;
        this.score = 0;
        this.bugNum = 0;
        // 移除飞机跟随鼠标移动事件
        document.removeEventListener("mousemove", this.mouseMove, false);
      }, 200);
    },
    // 提示信息
    promptMessage() {
      this.$message({
        // 可关闭
        showClose: true,
        message: "单击飞机暂停，双击飞机重新开始游戏噢!",
        // 持续时间
        duration: "2500",
        // Message 距离窗口顶部的偏移量
        offset: 100,
      });
    },
  },
};
</script>

<style lang="less" scoped>
.page-planeWar {
  .playgame {
    position: absolute;
    right: 30px;
    top: 200px;
    width: 60px;
    font-size: 14px;
    color: #00a1d6;
  }
  .mouse-img {
    position: absolute;
    right: 30px;
    top: 300px;
    width: 50px;
    height: 50px;
    z-index: 2;
    cursor: default;
  }
  .bullet {
    position: absolute;
    right: 53px;
    top: 200px;
    width: 3px;
    height: 10px;
    border-top-left-radius: 50%;
    border-top-right-radius: 50%;
    /* background: #efbe50; */
    background-image: linear-gradient(#f3dd61, #e0b244);
    z-index: 2;
  }
  .enemy {
    position: absolute;
    width: 30px;
    height: 30px;
    z-index: 2;
    transform: rotateZ(180deg);
  }
  .score {
    position: absolute;
    top: 15px;
    left: 45%;
    /* transform: translateX(-50%); */
    display: inline-block;
    color: #3d5970;
    font-size: 20px;
    font-weight: bold;
  }
  .bugnum {
    position: absolute;
    top: 40px;
    left: 45%;
    display: inline-block;
    color: #3d5970;
    font-size: 20px;
    font-weight: bold;
  }
}
</style>
