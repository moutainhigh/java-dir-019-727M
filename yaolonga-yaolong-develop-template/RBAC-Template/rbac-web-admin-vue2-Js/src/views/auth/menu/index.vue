<template>
  <div class="app-container">
    <el-card class="operate-container" shadow="never">
      <i class="el-icon-tickets" style="margin-top: 5px" />
      <span style="margin-top: 5px">数据列表</span>
      <el-button
        class="btn-add"
        size="mini"
        @click="handleAddMenu()"
      >
        添加
      </el-button>
    </el-card>
    <div class="table-container">
      <el-table
        ref="menuTable"
        v-loading="listLoading"
        style="width: 100%"
        :data="list"
        border
      >
        <el-table-column label="编号" width="100" align="center">
          <template slot-scope="scope">{{ scope.row.id }}</template>
        </el-table-column>
        <el-table-column label="菜单名称" align="center">
          <template slot-scope="scope">{{ scope.row.title }}</template>
        </el-table-column>
        <el-table-column label="菜单级数" width="100" align="center">
          <template slot-scope="scope">{{ scope.row.level | levelFilter }}</template>
        </el-table-column>
        <el-table-column label="菜单描述" align="center">
          <template slot-scope="scope">{{ scope.row.description }}</template>
        </el-table-column>
        <el-table-column label="前端图标" width="100" align="center">
          <template v-if="scope.row.icon" slot-scope="scope">
            <i v-if="scope.row.icon.indexOf(`el-icon-`) === 0" :class="menu.icon" />
            <el-image v-else-if="scope.row.icon.indexOf('http') === 0" :src="scope.row.icon" style="width: 20px;height: 20px;" />
            <svg-icon v-else :icon-class="scope.row.icon" />
          </template>
        </el-table-column>
        <el-table-column label="是否显示" width="100" align="center">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.status"
              :active-value="false"
              :inactive-value="true"
              @change="handleHiddenChange(scope.$index, scope.row)"
            />
          </template>
        </el-table-column>
        <el-table-column label="排序" width="100" align="center">
          <template slot-scope="scope">{{ scope.row.sort }}</template>
        </el-table-column>
        <el-table-column label="设置" width="120" align="center">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              :disabled="scope.row.level | disableNextLevel"
              @click="handleShowNextLevel(scope.$index, scope.row)"
            >查看下级
            </el-button>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200" align="center">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              @click="handleUpdate(scope.$index, scope.row)"
            >编辑
            </el-button>
            <el-button
              size="mini"
              type="text"
              @click="handleDelete(scope.$index, scope.row)"
            >删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="pagination-container">
      <el-pagination
        background
        layout="total, sizes,prev, pager, next,jumper"
        :page-size="listQuery.size"
        :page-sizes="[10,15,20]"
        :current-page.sync="listQuery.current"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>
  </div>
</template>

<script>
import { deleteMenuById, getMenuByPage, updateMenu } from '@/api/auth/menu'

export default {
  name: 'Menu',
  filters: {
    levelFilter(value) {
      if (value === 0) {
        return '一级'
      } else if (value === 1) {
        return '二级'
      }
    },
    disableNextLevel(value) {
      if (value === 0) {
        return false
      } else {
        return true
      }
    }
  },
  data() {
    return {
      list: null,
      total: null,
      listLoading: true,
      listQuery: {
        parentId: 0,
        current: 1,
        size: 10
      },
      parentId: 0
    }
  },
  watch: {
    $route(route) {
      this.resetParentId()
      this.getList()
    }
  },
  created() {
    this.resetParentId()
    this.getList()
  },
  methods: {
    resetParentId() {
      this.listQuery.current = 1
      if (this.$route.query.parentId != null) {
        this.listQuery.parentId = this.$route.query.parentId
      } else {
        this.listQuery.parentId = 0
      }
    },
    handleAddMenu() {
      this.$router.push('/auth/menu/add')
    },
    getList() {
      this.listLoading = true
      getMenuByPage(this.listQuery).then(response => {
        this.listLoading = false
        this.list = response.data.records
        this.total = response.data.total
      })
    },
    handleSizeChange(val) {
      this.listQuery.current = 1
      this.listQuery.size = val
      this.getList()
    },
    handleCurrentChange(val) {
      this.listQuery.current = val
      this.getList()
    },
    handleHiddenChange(index, row) {
      updateMenu({ id: row.id, status: row.status }).then(response => {
        this.$message({
          message: '修改成功',
          type: 'success',
          duration: 1000
        })
      })
    },
    handleShowNextLevel(index, row) {
      this.$router.push({ path: '/auth/menu', query: { parentId: row.id }})
    },
    handleUpdate(index, row) {
      this.$router.push({ path: '/auth/menu/update', query: { id: row.id }})
    },
    handleDelete(index, row) {
      this.$confirm('是否要删除该菜单', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteMenuById(row.id).then(response => {
          this.$message({
            message: '删除成功',
            type: 'success',
            duration: 1000
          })
          this.getList()
        })
      })
    }
  }
}
</script>

<style scoped>

</style>
