<template>
  <div id='protect-horse-index'>
    <div class="back" @click="$router.push('/protectTheHorse')">前往保卫大司马</div>
    <div class="title">{{title}}</div>
    <protectRadish
      v-if="isProtectTheHorse" 
      :isMobile="isMobile"
      :mapLevel="mapLevel" 
      :enemySource="newEnemySource"
      :towerList="newTowerList"
      :imgOnloadObj="imgOnloadObj"
      :towerOnloadImg="towerOnloadImg"
      :towerBulletOnloadImg="towerBulletOnloadImg"
    />
    <LevelSelect :mapLevel="mapLevel" @switchMapLevel="switchMapLevel" />
    <ProgressBar v-if="isProgressBar" :progress="progress" />
  </div>
</template>

<script>
import ProgressBar from './components/progressBar'
import protectRadish from './protectRadish'
import LevelSelect from './components/levelSelect'

import { setTheme } from '../../assets/theme/theme'
import { loadImage, gifToStaticImg } from './utils/handleImg'
import { isMobile } from './utils/tools'

import towerData from './dataSource/towerData'
import enemyData from './dataSource/enemyData'

export default {
  name: 'protect-horse-index',
  components: {
    ProgressBar,
    protectRadish,
    LevelSelect,
  },
  props: {},
  data() {
    return {
      title: '保卫萝卜4(低配版)',
      // 当前选择的地图
      mapLevel: 0,
      // 当前加载进度
      progress: 0,
      isProgressBar: true,
      // 控制游戏区域的显示与隐藏
      isProtectTheHorse: false,
      // 静态图片资源(地板，阻挡物等)
      imgObj: {
        floorTile: require("@/components/protectTheHorse/assets/img/floor-tile2.png")
      },
      // 敌人资源
      enemySource: enemyData,
      // 塔防数据 
      towerList: towerData,
      // 加载完成的静态图片
      imgOnloadObj: null,
      // 塔防加载完成图片
      towerOnloadImg: null,
      // 塔防子弹加载完成图片
      towerBulletOnloadImg: null,
      // 判断是否是手机
      isMobile: false,
      // 用于切换关卡克隆出来的一份数据
      newEnemySource: null,
      newTowerList: null
    };
  },
  computed: {
    progressStep() {
      return 95 / this.enemySource.length 
    }
  },
  created() {
    this.mapLevel = +this.$route.params.id
    if(isMobile()) {
      console.log('--is mobile--');
      setTheme('phone')
      this.isMobile = true
    }
    this.init()
  },
  methods: {
    /** 初始化加载图片等内容 */
    async init() {
      // 加载图片
      await this.allGifToStaticImg()
      this.imgOnloadObj = await loadImage(this.imgObj);
      this.towerOnloadImg = await loadImage(this.towerList, 'img');
      this.towerBulletOnloadImg = await loadImage(this.towerList, 'bulletImg');
      this.progress = 100
      this.handleData()
      setTimeout(() => {
        this.isProgressBar = false
        this.isProtectTheHorse = true
      }, 200);
    },
    handleData() {
      if(this.isMobile) {
        this.newEnemySource = this.$lodash.cloneDeep(this.enemySource)
        this.newTowerList = this.$lodash.cloneDeep(this.towerList)
      } else {
        this.newEnemySource = this.enemySource
        this.newTowerList = this.towerList
      }
    },
    /** 切换地图 */
    switchMapLevel(index) {
      if(this.mapLevel === index) return
      this.mapLevel = index
      this.$router.push(`/protectRadish/${index}`)
      this.isProtectTheHorse = false
      this.handleData()
      this.$nextTick(() => {this.isProtectTheHorse = true})
    },
    /** 等待所有的gif图生成静态图片 */
    async allGifToStaticImg() {
      return Promise.all(this.enemySource.map(async (item, index) => {
        this.enemySource[index].imgList = await gifToStaticImg(item)
        this.progress += this.progressStep
        return 
      })).then(res => {
        
      })
    },
  }
}
</script>
<style lang='less'>
#protect-horse-index {
  position: relative;
  box-sizing: border-box;
  width: 100vw;
  height: 100vh;
  background-color: #000;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  .title {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    font-size: 24px;
    font-weight: bold;
    height: 30px;
    line-height: 30px;
    color: #eee;
    text-align: center;
    user-select: none;
    animation: fall-animation .8s ease forwards;
  }
  @keyframes fall-animation {
    0% {
      opacity: 0;
      top: -50px;
    }
    100% {
      opacity: 1;
      top: 1%;
    }
  }
  .back {
    position: fixed;
    top: 20px;
    left: 20px;
    color: #fff;
    background: rgba(255, 255, 255, .3);
    padding: 4px 10px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 15px;
    user-select: none;
    &:hover {
      opacity: .8;
    }
  }
  
}
</style>