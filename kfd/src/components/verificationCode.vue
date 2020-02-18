<template>
<!-- 验证码 -->
  <div class="ValidCode disabled-select" @click="refreshCode">
    <span v-for="(item, index) in codeList" :key="index" :style="getStyle(item)">{{item.code}}</span>
  </div>
</template>

<script>
// 验证码组件
export default {
  data () {
    return {
      codeList: [],
      length:4,
    }
  },
  mounted () {
    this.createdCode()
  },
  methods: {
    //刷新验证码的方法
    refreshCode () {
      this.createdCode()
    },
    // 生成验证码的方法
    createdCode () {
      let len = this.length,
        codeList = [],
        chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz0123456789',
        charsLen = chars.length
      // 生成
      for (let i = 0; i < len; i++) {
        let rgb = [Math.round(Math.random() * 220), Math.round(Math.random() * 240), Math.round(Math.random() * 200),0.1+Math.random()*0.8]
        codeList.push({
          code: chars.charAt(Math.floor(Math.random() * charsLen)),
          color: `rgb(${rgb})`,
          fontSize: `1${[Math.floor(Math.random() * 10)]}px`,
          padding: `${[Math.floor(Math.random() * 10)]}px`,
          transform: `rotate(${Math.floor(Math.random() * 90) - Math.floor(Math.random() * 90)}deg)`
        })
      }
      // 指向
      this.codeList = codeList;
      // 将当前数据派发出去
      // this.$emit('update:value', codeList.map(item => item.code).join(''))
      this.$emit('sendData', codeList.map(item => item.code).join(''));
      //this.$emit('暴露给父组件的方法名',携带的参数); //记住你命名的这个方法
    //   map()方法返回一个新数组，数组中的元素为原始数组元素调用函数处理的后值。 
   // map()方法按照原始数组元素顺序依次处理元素。 
//    join]把数据转成字符串
    },
    // 每个元素生成动态的样式
    getStyle (data) {
      return `color: ${data.color}; font-size: ${data.fontSize}; padding: ${data.padding}; transform: ${data.transform}`
    }
  }
}
</script>

<style scoped>
  .ValidCode{
    width:100px;
    height:38px;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    border:1px solid #ccc; 
    background: #dddcdc;
  }
   span{
      display: inline-block;
    }
</style>