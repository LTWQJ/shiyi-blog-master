/**
 * 地图数据 
 * 控制x y轴的方向 1:左 2:上 3:右 4:下
 */
export default [
  {},
  {
    12: 1,
    7: 4,
  },
  {
    11: 1,
    18: 2,
    6: 4,
  },
  {
    9: 1,
    17: 3,
    7: 4, 15: 4,
  },
  {
    6: 1,
    13: 2,
    9: 3, 15: 3,
    4: 4, 7: 4,
  },
  // {
  //   : 1, : 1,
  //   : 2, : 2,
  //   : 3, : 3,
  //   : 4, : 4,
  // },
]

/** 初始格子的位置信息和总格子数量 */
const mapGridInfoList = [
  { x: 160, y: 320, x_y: 3, num: 10 },
  { x: 320, y: 80, x_y: 3, num: 18 },
  { x: 320, y: 80, x_y: 3, num: 23 },
  { x: 240, y: 80, x_y: 3, num: 23 },
  { x: 160, y: 80, x_y: 3, num: 17 },
]
export {
  mapGridInfoList
}