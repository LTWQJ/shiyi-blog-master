<template>
  <div class="cardbox" >
    <ul >
<!--    <div class="resourcecard">
      <h1>资源导航网站正在建设中，请稍后再查看</h1>
    </div>-->
    </ul>
    <ChatGPT></ChatGPT>
  </div>

</template>

<script>
import ChatGPT from '@/views/chatgpt/ChatGPT.vue';
import Link from "@/views/link/Link.vue";
export default {
  components: {
    Link,
    ChatGPT,
  },
  mounted() {
  },
  created() {

  },
  name: "websitenavigation",
  data(){
  return{
    imglist:[],
  }
  },
  methods:{

  }
}

</script>

<style scoped>
.cardbox{
  position: relative;
  width: 100vw;
  height: 100vh;
  /*设置背景样式*/
  background: rgba(255, 255, 225, 0.1) url("./../../assets/img/bg.png");
  justify-content: center;
  align-items: center;
}
.resourcecard{
  margin: 0 auto;
  display: flex;
  width: 400px;
  height: 250px;
  /*设置阴影*/
  box-shadow: 20px 20px 50px rgba(0,0,0,0.5);
  /*设置圆角*/
  border-radius:15px;
  /*设置上边界和左边界亮纹，使card有一种层次感*/
  border-top: 1px solid rgba(255,255,255,0.5);
  border-left: 1px solid rgba(255,255,255,0.5);

  /*设置背景样式*/
  background: rgba(255,255,255,0.1);
  /*让透过card的底部元素模糊化,达到毛玻璃效果*/
  backdrop-filter: blur(5px);
}
.resourcecard:hover{
  background: rgba(255,255,255,0.5);

}
</style>