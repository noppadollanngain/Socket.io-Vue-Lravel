<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header">
            Chat
          </div>
          <div class="card-body">
            <div v-for="(show, index) in message" :key="index">
              <li> {{ show.text }}</li>
            </div>
          </div>
          <div class="card-footer">
            <div style="display:flex;" class="form-group">
              <input type="text" class="form-control" placeholder="type your chat" v-model='text' @keyup.enter='sendText'>
            </div>
          </div>
        </div>
      </div>  
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      text: '',
      message: {},
    }
  },
  methods:{
    sendText() {
      axios({
        url: '/api/create/message',
        method: 'post',
        data: {
          text: this.text
        }
      }).then(res => {
        this.$root.socket.emit('chatMessage', res.data.text);
        this.text = '';
      });
    },
    fatchMessage() {
      axios({
        url: '/api/fatch/message',
        method: 'get',
      }).then(res => {
        this.message = res.data
      })
    }
  },
  created() {
    this.fatchMessage();
  },
  mounted() {
    let vm = this;
    this.$root.socket.on('chatMessage', function () {
      vm.fatchMessage();
    })
  }
}
</script>
