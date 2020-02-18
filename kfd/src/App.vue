<template>
  <div id="app">
    <my-header></my-header>
    <router-view/>
    <my-foot></my-foot>
  </div>
</template>

<script>
  export default {
     data(){
       return{

       }
     },
     methods:{

     }
  }

</script>
<style>
*{margin:0;padding:0}
a{
  text-decoration:none;
  color:#767676;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>
