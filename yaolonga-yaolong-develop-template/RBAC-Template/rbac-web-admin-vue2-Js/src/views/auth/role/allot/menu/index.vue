<template>
  <div class="tree-container">
    <el-card class="form-container " style="height: calc(100vh - 140px)" shadow="never">
      <div style="height: calc(100vh - 280px);overflow: auto">
        <el-tree
          ref="tree"
          :data="menuTreeList"
          show-checkbox
          default-expand-all
          node-key="id"
          highlight-current
          :props="defaultProps"
        />
      </div>
      <div align="center">
        <el-button type="primary" @click="handleSave()">保存</el-button>
        <el-button @click="handleClear()">清空</el-button>
      </div>
    </el-card>
  </div>
</template>

<script>
import { allotMenu } from '@/api/auth/role'
import { getMenuByRoleId, getMenuList } from '@/api/auth/menu'

export default {
  name: 'Index',
  data() {
    return {
      menuTreeList: [],
      defaultProps: {
        children: 'children',
        label: 'title'
      },
      roleId: null
    }
  },
  created() {
    this.roleId = this.$route.query.roleId
    this.treeList()
    this.getRoleMenu(this.roleId)
  },
  methods: {
    treeList() {
      getMenuList().then(response => {
        this.menuTreeList = response.data
      })
    },
    getRoleMenu(roleId) {
      getMenuByRoleId(roleId).then(response => {
        const menuList = response.data
        const checkedMenuIds = []
        if (menuList != null && menuList.length > 0) {
          for (let i = 0; i < menuList.length; i++) {
            const menu = menuList[i]
            if (menu.parentId !== 0) {
              checkedMenuIds.push(menu.id)
            }
          }
        }
        this.$refs.tree.setCheckedKeys(checkedMenuIds)
      })
    },
    handleSave() {
      const checkedNodes = this.$refs.tree.getCheckedNodes()
      const checkedMenuIds = new Set()
      if (checkedNodes != null && checkedNodes.length > 0) {
        for (let i = 0; i < checkedNodes.length; i++) {
          const checkedNode = checkedNodes[i]
          checkedMenuIds.add(checkedNode.id)
          if (checkedNode.parentId !== 0) {
            checkedMenuIds.add(checkedNode.parentId)
          }
        }
      }
      this.$confirm('是否分配菜单？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const data = {
          roleId: this.roleId,
          menuIds: Array.from(checkedMenuIds)
        }
        allotMenu(data).then(response => {
          this.$message({
            message: '分配成功',
            type: 'success',
            duration: 1000
          })
          this.$router.back()
        })
      })
    },
    handleClear() {
      this.$refs.tree.setCheckedKeys([])
    }
  }
}
</script>

<style lang="scss" scoped>
.tree-container {
  min-height: 100%!important;
  width: 100%;
  overflow: auto;
}
</style>
