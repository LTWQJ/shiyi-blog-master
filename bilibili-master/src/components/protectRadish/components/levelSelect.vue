<template>
  <div class='com-level-select'>
    <div class="map-title">地图</div>
    <div 
      class="item" 
      v-for="(item,index) in levelData" 
      :key="index"
      :class="{'active': mapLevel === index}" 
      @click="switchMapLevel(index)"
    >
      {{ index !== levelData.length - 1 ? item : '卍'}}
    </div>
  </div>
</template>

<script>
import { mapGridInfoList } from '../dataSource/mapData'
export default {
  name: '',
  props: {
    mapLevel: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      levelData: []
    };
  },
  created() {
    this.levelData = mapGridInfoList.map((item, i) => i + 1)
  },
  methods: {
    switchMapLevel(index) {
      this.$emit('switchMapLevel', index)
    }
  }
}
</script>
<style lang='less' scoped>
.com-level-select {
  position: fixed;
  left: calc(@radishSize * -1);
  top: 50%;
  background: rgba(109, 218, 245, 0.8);
  padding: calc(@radishSize * 0.3);
  border-radius: 0 8px 8px 0;
  transform: translate(0, -50%);
  transition: 0.2s transform;
  &:hover {
    transform: translate(@radishSize, -50%);
  }
  .map-title {
    font-size: calc(@radishSize * 0.4);
    font-weight: bold;
    color: #fff;
    text-align: center;
    margin-bottom: 12px;
  }
  .item {
    color: #fff;
    font-size: 24px;
    cursor: pointer;
    width: @radishSize;
    height: @radishSize;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: calc(@radishSize * 0.2);
    margin-bottom: 12px;
    &:hover {
      background: rgba(109, 218, 245, 0.7);
    }
  }
  .active {
    background: rgba(109, 218, 245, 0.6);
  }

}
</style>