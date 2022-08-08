<template>
  <div class="icons-container">
    <el-tabs type="border-card">
      <el-tab-pane label="Icons" class="tab-item">
        <div class="grid">
          <div v-for="item of svgIcons" :key="item" @click="handleClipboard(generateIconCode(item),$event)">
            <el-tooltip placement="top">
              <div slot="content">
                {{ generateIconCode(item) }}
              </div>
              <div class="icon-item">
                <svg-icon :icon-class="item" class-name="disabled" />
                <span>{{ item }}</span>
              </div>
            </el-tooltip>
          </div>
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import svgIcons from './svg-icons'
import elementIcons from './element-icons'
import { find } from '@/utils'

export default {
  name: 'Icons',
  data() {
    return {
      deleteFile: [],
      svgIcons,
      elementIcons,
      icon: [],
      url: ''
    }
  },
  watch: {
    icon(val) {
      if (val.length > 0) {
        console.log(val)
        this.url = val[0].url
      }
    }
  },
  methods: {
    rest() {
      this.icon = []
      this.url = ''
    },
    generateIconCode(symbol) {
      return symbol
      // return `<svg-icon icon-class="${symbol}" />`
    },
    generateElementIconCode(symbol) {
      return `el-icon-${symbol}`
      // return `<i class="el-icon-${symbol}" />`
    },
    handleClipboard(text, event) {
      this.$emit('chooseIcon', text)
      // clipboard(text, event)
      this.icon = []
      this.url = ''
    },
    // 将删除的图片存入
    onDelFile(file) {
      var url = file.url
      if (url) {
        const fileName = url.substring(find(url, '/', 3) + 1)
        console.log('我删除了图片', fileName)
        // 将删除的图片存入提交活销毁页面时候oss删除
        this.deleteFile.push(fileName)
      } else {
        console.log('当前图片未上传不能删除')
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.icons-container {
  margin: 10px 20px 0;

  .tab-item{
    overflow: auto;
    height: calc(100vh - 400px);

      .grid {
        position: relative;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
      }

      .icon-item {
        margin: 20px;
        height: 85px;
        text-align: center;
        width: 100px;
        float: left;
        font-size: 30px;
        color: #24292e;
        cursor: pointer;
      }

      span {
        display: block;
        font-size: 16px;
        margin-top: 10px;
      }

      .disabled {
        pointer-events: none;
      }
  }

}
</style>
