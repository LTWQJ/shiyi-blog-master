/**
 * 塔防数据
 * name:名称, money:花费, r:攻击半径, damage:伤害, targetNum:攻击目标数量, rate:攻击速率(n毫秒/次), speed:子弹速度, isThrough:是否是穿透性攻击, slow:{num:减速倍数,time:减速时间}  bSize: 子弹大小, img:塔防图片, bulletImg:子弹图片
 */

export default [
  {name: '射手',     money: 250, saleMoney: 125, r: 160, damage: 1, targetNum: 1, rate: 300, speed: 8, bSize: {w:30,h:30},    audioKey: 'pea-one',  img: require(`@/components/protectTheHorse/assets/img/plant/shoot.png`), bulletImg: require(`@/components/protectTheHorse/assets/img/plant/bullet1.png`)},
  {name: '茄子',     money: 500, saleMoney: 250, r: 250, damage: 6, targetNum: 1, rate: 1000, speed: 12, bSize: {w:30,h:30}, audioKey: 'qizi-wujie', img: require(`@/components/protectTheHorse/assets/img/plant/qiezi.png`), bulletImg: require(`@/components/protectTheHorse/assets/img/plant/bullet3.png`)},
  {name: '风车',     money: 500, saleMoney: 250, r: 250, damage: 2, targetNum: 1, rate: 1000, speed: 6, bSize: {w:80,h:80}, isThrough: true, audioKey: 'fengche', img: require(`@/components/protectTheHorse/assets/img/plant/fengche.png`), bulletImg: require(`@/components/protectTheHorse/assets/img/plant/bullet-fengche.png`)},
  {name: 'PDD',      money: 600, saleMoney: 300, r: 200, damage: 4, targetNum: 20, rate: 2000, speed: 10, bSize: {w:25,h:25},   audioKey: 'pdd-heihei', img: require(`@/components/protectTheHorse/assets/img/plant/pdd.png`), bulletImg: require(`@/components/protectTheHorse/assets/img/plant/bullet1.png`)},
  {name: '冰星',     money: 800, saleMoney: 400, r: 200, damage: 1, targetNum: 20, rate: 900, speed: 8, slow: {num: 2, time: 5000}, bSize: {w:40,h:40},   audioKey: 'slow-star', img: require(`@/components/protectTheHorse/assets/img/plant/tower_slow.png`), bulletImg: require(`@/components/protectTheHorse/assets/img/plant/bullet_star.png`)},
]