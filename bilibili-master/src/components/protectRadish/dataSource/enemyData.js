/**
 * 敌人资源 
 * curFloorI: 当前所在格的索引, imgList: gif转静态图片数组, curSpeed: 当前的速度
 * ∵ offset.y = 10; ∴ h + y = 90
 */

export default [
  {name: '旗子僵尸',  x: 0, y: 0, w: 100, h: 100, curFloorI: 0, curSpeed: 1, speed: 1, reward: 50, hp: {cur: 10, sum: 10, size: 8},    audioKey: 'pvz-pieces', type: 'gif', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/zombies_0_move.gif`), imgList: [], imgIndex: 0},
  {name: '兔子1',     x: 0, y: 0, w: 100, h: 100, curFloorI: 0, curSpeed: 1, speed: 1, reward: 20, hp: {cur: 20, sum: 20, size: 8},    audioKey: 'pvz', type: 'gif', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/rabbish_1.gif`), imgList: [], imgIndex: 0},
  {name: '兔子2',     x: 0, y: 0, w: 100, h: 100, curFloorI: 0, curSpeed: 1, speed: 1, reward: 40, hp: {cur: 50, sum: 50, size: 8},    audioKey: 'pvz', type: 'gif', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/rabbish_2.gif`), imgList: [], imgIndex: 0},
  {name: '普通僵尸',  x: 0, y: 0, w: 100, h: 100, curFloorI: 0, curSpeed: 1, speed: 1, reward: 10, hp: {cur: 10, sum: 10, size: 8},    audioKey: 'pvz', type: 'gif', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/zombies_1_move.gif`), imgList: [], imgIndex: 0},
  {name: '铁通僵尸',  x: 0, y: 0, w: 100, h: 100, curFloorI: 0, curSpeed: 1, speed: 1, reward: 20, hp: {cur: 30, sum: 30, size: 8},    audioKey: 'pvz-drum', type: 'gif', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/zombies_3_move.gif`), imgList: [], imgIndex: 0},
  {name: '橄榄球僵尸',x: 0, y: 0, w: 110, h: 110, curFloorI: 0, curSpeed: 1.5, speed: 1.5, reward: 60, hp: {cur: 80, sum: 80, size: 8},     audioKey: 'pvz-armor', type: 'gif', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/zombies_5_move.gif`), imgList: [], imgIndex: 0},
  {name: '舞王',      x: 0, y: 0, w: 100, h: 100, curFloorI: 0, curSpeed: 1.5, speed: 1.5, reward: 100, hp: {cur: 50, sum: 50, size: 8},     skill: {time: 3000}, audioKey: 'pvz-dance', type: 'gif', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/zombies_7_move.gif`), imgList: [], imgIndex: 0},
  {name: '舞王小兵',  x: 0, y: 0, w: 100, h: 100, curFloorI: 0,  curSpeed: 1.5, speed: 1.5, reward: 5, hp: {cur: 10, sum: 10, size: 8},       audioKey: 'pvz-dance-little', type: 'gif', imgSource: require("@/components/protectTheHorse/assets/img/zombies/zombies_10_move.gif"), imgList: [], imgIndex: 0},
  {name: '兔子1png',     x: 0, y: 0, w: 100, h: 100, curFloorI: 0, curSpeed: 1, speed: 1, reward: 120, hp: {cur: 150, sum: 150, size: 8},    audioKey: 'pvz', type: 'png', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/rabbish_1.png`), imgList: [], imgIndex: 0},
  {name: '兔子2png',     x: 0, y: 0, w: 100, h: 100, curFloorI: 0, curSpeed: 1, speed: 1, reward: 150, hp: {cur: 250, sum: 250, size: 8},    audioKey: 'pvz', type: 'png', imgSource: require(`@/components/protectTheHorse/assets/img/zombies/rabbish_2.png`), imgList: [], imgIndex: 0},
]