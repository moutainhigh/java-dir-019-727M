<template>
  <el-card class="form-container" shadow="never">
    <el-form
      ref="menuFrom"
      :model="menu"
      :rules="rules"
      label-width="150px"
    >
      <el-form-item label="菜单名称：" prop="title">
        <el-input v-model="menu.title" placeholder="菜单名称" />
      </el-form-item>
      <el-form-item label="英文名称：" prop="title">
        <el-input v-model="menu.name" placeholder="英文名称" />
      </el-form-item>
      <el-form-item label="上级菜单：">
        <el-select
          v-model="menu.parentId"
          placeholder="请选择菜单"
        >
          <el-option
            v-for="item in selectMenuList"
            :key="item.id"
            :label="item.title"
            :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="前端路径：" prop="url">
        <el-input v-model="menu.url" placeholder="前端路径" />
      </el-form-item>
      <el-form-item label="前端组件：" prop="component">
        <el-input v-model="menu.component" placeholder="前端组件路径地址" />
      </el-form-item>
      <el-form-item label="描述：" prop="description">
        <el-input v-model="menu.description" placeholder="描述" />
      </el-form-item>
      <el-form-item label="前端图标：" prop="icon">
        <el-input v-model="menu.icon" placeholder="前端图标" style="width: 80%">
          <el-button slot="append" @click="selectIcon">选择</el-button>
        </el-input>
        <div v-if="menu.icon&&menu.icon.length !==0" style="display: inline-block" class="margin-left-10">
          <i v-if="menu.icon.indexOf(`el-icon-`) === 0" :class="menu.icon" />
          <el-image v-else-if="menu.icon.indexOf('http') === 0" :src="menu.icon" style="width: 25px;height: 25px;" />
          <svg-icon v-else :icon-class="menu.icon" />
        </div>
      </el-form-item>
      <el-form-item label="菜单层级：" prop="title">
        <el-input v-model="menu.level" placeholder="菜单层级" />
      </el-form-item>
      <el-form-item label="是否显示：">
        <el-radio-group v-model="menu.hidden">
          <el-radio :label="false">是</el-radio>
          <el-radio :label="true">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="排序：">
        <el-input v-model="menu.sort" placeholder="排序" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit('menuFrom')">提交</el-button>
        <el-button v-if="!isEdit" @click="resetForm('menuFrom')">重置</el-button>
      </el-form-item>
    </el-form>
    <!--弹出框---选择图标-->
    <el-dialog
      title="选择图标"
      style="height: calc(100vh - 38px)"
      width="60%"
      :visible.sync="dialogVisibleIcon"
      append-to-body
    >
      <icons class="icons" @chooseIcon="chooseIcon" />
    </el-dialog>
  </el-card>
</template>

<script>

import { createMenu, getMenuById, getMenuList, updateMenu } from '@/api/auth/menu'
import Icons from '@/views/auth/menu/components/icons/index'
const defaultMenu = {
  component: '',
  name: '',
  title: '',
  parentId: 0,
  level: 0,
  description: '',
  icon: '',
  status: false,
  url: '',
  sort: 0
}
export default {
  name: 'MenuDetail',
  components: { Icons },
  props: {
    isEdit: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      dialogVisibleIcon: false,
      menu: Object.assign({}, defaultMenu),
      selectMenuList: [],
      rules: {
        name: [
          { required: true, message: '请输入菜单英文名称', trigger: 'blur' },
          { min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur' }
        ],
        title: [
          { required: true, message: '请输入菜单名称', trigger: 'blur' },
          { min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur' }
        ],
        components: [
          { required: true, message: '请输入前端组件路径', trigger: 'blur' },
          { min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur' }
        ],
        icon: [
          { required: true, message: '请输入前端图标', trigger: 'blur' },
          { min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur' }
        ],
        url: [
          { required: true, message: '请输入前端路径', trigger: 'blur' },
          { min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  created() {
    if (this.isEdit) {
      getMenuById(this.$route.query.id).then(response => {
        this.menu = response.data
      })
    } else {
      this.menu = Object.assign({}, defaultMenu)
    }
    this.getSelectMenuList()
  },
  methods: {
    getSelectMenuList() {
      getMenuList().then(response => {
        this.selectMenuList = response.data
        this.selectMenuList.unshift({ id: 0, title: '无上级菜单' })
      })
    },
    onSubmit(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$confirm('是否提交数据', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            if (this.isEdit) {
              updateMenu(this.menu).then(response => {
                this.$message({
                  message: '修改成功',
                  type: 'success',
                  duration: 1000
                })
                this.$router.back()
              })
            } else {
              createMenu(this.menu).then(response => {
                this.$refs[formName].resetFields()
                this.resetForm(formName)
                this.$message({
                  message: '提交成功',
                  type: 'success',
                  duration: 1000
                })
                this.$router.back()
              })
            }
          })
        } else {
          this.$message({
            message: '验证失败',
            type: 'error',
            duration: 1000
          })
          return false
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields()
      this.menu = Object.assign({}, defaultMenu)
      this.getSelectMenuList()
    },
    selectIcon() {
      this.dialogVisibleIcon = true
    },
    /**
     * 图标选择回调
     */
    chooseIcon(item) {
      this.menu.icon = item
      this.dialogVisibleIcon = false
    }
  }
}
</script>

<style scoped>

</style>
