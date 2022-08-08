<template>
  <div class="app-container">
    <el-card class="filter-container" shadow="never">
      <div>
        <i class="el-icon-search" />
        <span>筛选搜索</span>
        <el-button
          style="float:right"
          type="primary"
          size="small"
          @click="handleSearchList()"
        >
          查询搜索
        </el-button>
        <el-button
          style="float:right;margin-right: 15px"
          size="small"
          @click="handleResetSearch()"
        >
          重置
        </el-button>
      </div>
      <div style="margin-top: 15px">
        <el-form :inline="true" :model="listQuery" size="small" label-width="140px">
          <el-form-item label="输入角色名称：">
            <el-input v-model="listQuery.name" class="input-width" placeholder="角色名称" clearable />
          </el-form-item>
          <el-form-item label="输入英文名称：">
            <el-input v-model="listQuery.enName" class="input-width" placeholder="英文名称" clearable />
          </el-form-item>
          <el-form-item label="输入角色描述：">
            <el-input v-model="listQuery.description" class="input-width" placeholder="角色描述" clearable />
          </el-form-item>
        </el-form>
      </div>
    </el-card>
    <el-card class="operate-container" shadow="never">
      <i class="el-icon-tickets" />
      <span>数据列表</span>
      <el-button size="mini" class="btn-add" style="margin-left: 20px" @click="handleAdd()">添加</el-button>
    </el-card>
    <div class="table-container">
      <el-table
        ref="roleTable"
        v-loading="listLoading"
        :data="list"
        style="width: 100%;"
        border
      >
        <el-table-column label="编号" width="100" align="center">
          <template slot-scope="scope">{{ scope.row.id }}</template>
        </el-table-column>
        <el-table-column label="角色名称" align="center">
          <template slot-scope="scope">{{ scope.row.name }}</template>
        </el-table-column>
        <el-table-column label="英文名称" align="center">
          <template slot-scope="scope">{{ scope.row.enName }}</template>
        </el-table-column>
        <el-table-column label="描述" align="center">
          <template slot-scope="scope">{{ scope.row.description }}</template>
        </el-table-column>
        <el-table-column label="添加时间" width="160" align="center">
          <template slot-scope="scope">{{ scope.row.createTime | formatDateTime }}</template>
        </el-table-column>
        <el-table-column label="是否启用" width="140" align="center">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.status"
              :active-value="true"
              :inactive-value="false"
              @change="handleStatusChange(scope.$index, scope.row)"
            />
          </template>
        </el-table-column>
        <el-table-column label="操作" width="160" align="center">
          <template slot-scope="scope">
            <el-row>
              <el-button
                size="mini"
                type="text"
                @click="handleSelectMenu(scope.$index, scope.row)"
              >分配菜单
              </el-button>
              <el-button
                size="mini"
                type="text"
                @click="handleSelectPermission(scope.$index, scope.row)"
              >分配资源
              </el-button>
            </el-row>
            <el-row>
              <el-button
                size="mini"
                type="text"
                @click="handleUpdate(scope.$index, scope.row)"
              >
                编辑
              </el-button>
              <el-button
                size="mini"
                type="text"
                @click="handleDelete(scope.$index, scope.row)"
              >删除
              </el-button>
            </el-row>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="pagination-container">
      <el-pagination
        background
        layout="total, sizes,prev, pager, next,jumper"
        :current-page.sync="listQuery.current"
        :page-size="listQuery.size"
        :page-sizes="[5,10,15]"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>
    <el-dialog
      :title="isEdit?'编辑角色':'添加角色'"
      :visible.sync="dialogVisible"
      width="40%"
    >
      <el-form
        ref="roleForm"
        :model="role"
        label-width="150px"
        size="small"
      >
        <el-form-item label="角色名称：">
          <el-input v-model="role.name" style="width: 250px" />
        </el-form-item>
        <el-form-item label="英文名称：">
          <el-input v-model="role.enName" placeholder="注意角色英文名必须为ROLE_开头" style="width: 250px" />
        </el-form-item>
        <el-form-item label="描述：">
          <el-input
            v-model="role.description"
            type="textarea"
            :rows="5"
            style="width: 250px"
          />
        </el-form-item>
        <el-form-item label="是否启用：">
          <el-radio-group v-model="role.status">
            <el-radio :label="true">是</el-radio>
            <el-radio :label="false">否</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="small" @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" size="small" @click="handleDialogConfirm()">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>

import { parseTime } from '@/utils'
import { createRole, deleteRoleById, getRoleByPage, updateRole } from '@/api/auth/role'

const defaultListQuery = {
  current: 1,
  size: 5,
  name: null,
  description: null,
  enName: null
}
const defaultRole = {
  id: null,
  name: null,
  parentId: 0,
  description: null,
  enName: null,
  status: true
}
export default {
  name: 'RoleList',
  filters: {
    formatDateTime(date) {
      if (date == null || date === '') {
        return 'N/A'
      }
      return parseTime(date, '{y}-{m}-{d} {h}:{i}:{s}')
    }
  },
  data() {
    return {
      listQuery: Object.assign({}, defaultListQuery),
      list: null,
      total: null,
      listLoading: false,
      dialogVisible: false,
      role: Object.assign({}, defaultRole),
      isEdit: false
    }
  },
  created() {
    this.getList()
  },
  methods: {
    handleResetSearch() {
      this.listQuery = Object.assign({}, defaultListQuery)
    },
    handleSearchList() {
      this.listQuery.current = 1
      this.getList()
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
    handleAdd() {
      this.dialogVisible = true
      this.isEdit = false
      this.role = Object.assign({}, defaultRole)
    },
    handleStatusChange(index, row) {
      this.$confirm('是否要修改该状态?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        updateRole({ id: row.id, status: row.status }).then(response => {
          this.$message({
            type: 'success',
            message: '修改成功!'
          })
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消修改'
        })
        this.getList()
      })
    },
    handleDelete(index, row) {
      this.$confirm('是否要删除该角色?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteRoleById(row.id).then(response => {
          this.$message({
            type: 'success',
            message: '删除成功!'
          })
          this.getList()
        })
      })
    },
    handleUpdate(index, row) {
      this.dialogVisible = true
      this.isEdit = true
      this.role = Object.assign({}, row)
    },
    handleDialogConfirm() {
      this.$confirm('是否要确认?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (this.isEdit) {
          updateRole(this.role).then(response => {
            this.$message({
              message: '修改成功！',
              type: 'success'
            })
            this.dialogVisible = false
            this.getList()
          })
        } else {
          createRole(this.role).then(response => {
            this.$message({
              message: '添加成功！',
              type: 'success'
            })
            this.dialogVisible = false
            this.getList()
          })
        }
      })
    },
    handleSelectMenu(index, row) {
      this.$router.push({ path: '/auth/role/allot/menu', query: { roleId: row.id }})
    },
    handleSelectPermission(index, row) {
      // this.$message.info('此功能还在开发当中')
      this.$router.push({ path: '/auth/role/allot/permission', query: { roleId: row.id }})
    },
    getList() {
      this.listLoading = true
      getRoleByPage(this.listQuery).then(response => {
        this.listLoading = false
        this.list = response.data.records
        this.total = response.data.total
      })
    }
  }
}
</script>
<style></style>

