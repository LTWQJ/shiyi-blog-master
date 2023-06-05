<template>
  <div v-show="chooseEmoji" class="emoji-wrapper">
    <span
      class="emoji-item"
      v-for="(item, index) of emojiList"
      :key="index"
      @click="addEmoji(item)"
    >
      <span class="emoji" style="">{{ item.emoji }}
      </span>
    </span>
  </div>
</template>

<script>
export default {
  props: {
    chooseEmoji: {
      type: Boolean
    }
  },
  data: function() {
    return {
      emojiList: null
    };
  },
  created() {
    this.emojiList = require('../assets/emoji.json');
  },
  methods: {
    addEmoji(item) {
      this.$emit("addEmoji", item);
    }
  }
};
</script>

<style scoped>
.emoji {
  display: inline-block;
  width: 30px;
  height: 30px;
  text-align: center;
  line-height: 30px;
  font-size: 20px;
}

.emoji-item {
  cursor: pointer;
  display: inline-block;
}

.emoji-item:hover {
  transition: all 0.2s;
  border-radius: 0.25rem;
  background: #dddddd;
}

.emoji-wrapper {
  max-height: 150px;
  overflow-y: auto;
}
</style>
