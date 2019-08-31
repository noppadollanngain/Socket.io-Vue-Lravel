require('./bootstrap');

import io from 'socket.io-client';

window.Vue = require('vue');

Vue.component('example-component', require('./components/ExampleComponent.vue').default);

const app = new Vue({
    el: '#app',
    data() {
        return {
            socket : io(':6999')
        }
    }
});
