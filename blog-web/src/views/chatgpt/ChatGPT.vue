<template>
  <div class="chat-container">
    <div class="chat-box">
      <div class="messages">
        <div v-for="message in messages" :key="message.id" :class="message.role + '-message'">
          {{ message.content }}
        </div>
      </div>
    </div>
    <div class="input-box">
      <input v-model="userInput" @keydown.enter="sendMessage" placeholder="Type your message..." />
      <button @click="sendMessage">Send</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      userInput: '',
      messages: [],
    };
  },
  methods: {
    async sendMessage() {
      // 添加用户输入到消息列表
      this.messages.push({
        id: this.messages.length,
        role: 'user',
        content: this.userInput,
      });

      try {
        // 发送请求到 OpenAI API
        const response = await axios.post(
            'https://api.openai.com/v1/chat/completions',
            {
              messages: [
                { role: 'system', content: 'You are a helpful assistant.' },
                ...this.messages,
              ],
            },
            {
              headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearersk-3p1m8bNaK2beNNwCB0UfT3BlbkFJndZO9m0nf5kCuGWhSjwG`,
              },
            }
        );

        // 获取 ChatGPT-3.5 的回复
        const reply = response.data.choices[0].message.content;

        // 添加 ChatGPT-3.5 的回复到消息列表
        this.messages.push({
          id: this.messages.length,
          role: 'assistant',
          content: reply,
        });
      } catch (error) {
        console.error('ChatGPT request failed:', error);
        this.messages.push({
          id: this.messages.length,
          role: 'assistant',
          content: 'Sorry, an error occurred while processing your request.',
        });
      }

      // 清空用户输入
      this.userInput = '';
    },
  },
};
</script>

<style scoped>
.chat-container {
  display: flex;
  flex-direction: column;
  max-width: 400px;
  margin: 0 auto;
}

.chat-box {
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 10px;
  margin-bottom: 10px;
}

.messages {
  display: flex;
  flex-direction: column;
}

.user-message {
  align-self: flex-end;
  background-color: #b3d6ff;
  padding: 5px;
  margin-bottom:
      4px;
}

.assistant-message {
  align-self: flex-start;
  background-color: #f0f0f0;
  padding: 5px;
  margin-bottom: 4px;
}

.input-box {
  display: flex;
  align-items: center;
}

input {
  flex: 1;
  height: 30px;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-right: 5px;
}

button {
  height: 30px;
  padding: 0 10px;
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>