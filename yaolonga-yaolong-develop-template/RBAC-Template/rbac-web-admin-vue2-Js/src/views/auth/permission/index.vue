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
      <div style="margin-top: 20px">
        <el-form :inline="true" :model="listQuery" size="small" label-width="140px">
          <el-form-item label="资源名称：">
            <el-input v-model="listQuery.name" class="input-width" placeholder="资源名称" clearable />
          </el-form-item>
          <el-form-item label="资源路径：">
            <el-input v-model="listQuery.path" class="input-width" placeholder="资源路径" clearable />
          </el-form-item>
          <el-form-item label="资源描述：">
            <el-input v-model="listQuery.description" class="input-width" placeholder="资源描述" clearable />
          </el-form-item>
          <el-form-item label="资源分类：">
            <el-select v-model="listQuery.categoryId" placeholder="全部" clearable class="input-width">
              <el-option
                v-for="item in categoryOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="资源归属：">
            <el-select v-model="listQuery.type" placeholder="全部" clearable class="input-width">
              <el-option
                v-for="item in typeOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
    <el-card class="operate-container" shadow="never">
      <i class="el-icon-tickets" />
      <span>数据列表</span>
      <el-button size="mini" class="btn-add" style="margin-left: 20px" @click="handleAdd()">添加</el-button>
      <el-button size="mini" class="btn-add" @click="handleShowCategory()">资源分类</el-button>
    </el-card>
    <div class="table-container">
      <el-table
        ref="resourceTable"
        v-loading="listLoading"
        :data="list"
        style="width: 100%;"
        border
      >
        <el-table-column label="编号" width="100" align="center">
          <template slot-scope="scope">{{ scope.row.id }}</template>
        </el-table-column>
        <el-table-column label="资源名称" align="center">
          <template slot-scope="scope">{{ scope.row.name }}</template>
        </el-table-column>
        <el-table-column label="资源路径" align="center">
          <template slot-scope="scope">{{ scope.row.path }}</template>
        </el-table-column>
        <el-table-column label="资源归属" align="center">
          <template slot-scope="scope">
            <el-tag :type="scope.row.type | filterTagType">{{ scope.row.type | filterType }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="描述" align="center">
          <template slot-scope="scope">{{ scope.row.description }}</template>
        </el-table-column>
        <el-table-column label="创建时间" width="160" align="center">
          <template slot-scope="scope">{{ scope.row.createTime | formatDateTime }}</template>
        </el-table-column>
        <el-table-column label="更新时间" width="160" align="center">
          <template slot-scope="scope">{{ scope.row.updateTime | formatDateTime }}</template>
        </el-table-column>
        <el-table-column label="操作" width="140" align="center">
          <template slot-scope="scope">
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
        :page-sizes="[10,15,20]"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>
    <el-dialog
      :title="isEdit?'编辑资源':'添加资源'"
      :visible.sync="dialogVisible"
      width="40%"
    >
      <el-form
        ref="resourceForm"
        :model="resource"
        label-width="150px"
        size="small"
      >
        <el-form-item label="资源名称：">
          <el-input v-model="resource.name" style="width: 250px" />
        </el-form-item>
        <el-form-item label="资源路径：">
          <el-input v-model="resource.path" style="width: 250px" />
        </el-form-item>
        <el-form-item label="资源分类：">
          <el-select v-model="resource.categoryId" placeholder="全部" clearable style="width: 250px">
            <el-option
              v-for="item in categoryOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="资源归属：">
          <el-select v-model="resource.type" placeholder="全部" clearable style="width: 250px">
            <el-option
              v-for="item in typeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="描述：">
          <el-input
            v-model="resource.description"
            type="textarea"
            :rows="5"
            style="width: 250px"
          />
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
import {
  createPermission,
  deletePermissionById,
  getPermissionByPage,
  updatePermission
} from '@/api/auth/permission'
import { getPermissionCate } from '@/api/auth/permission-category'

const defaultListQuery = {
  current: 1,
  size: 10,
  name: null,
  path: null,
  type: null,
  categoryId: null,
  description: null
}
const defaultResource = {
  id: null,
  name: null,
  path: null,
  type: null,
  categoryId: null,
  description: ''
}
export default {
  name: 'ResourceList',
  filters: {
    formatDateTime(time) {
      if (time == null || time === '') {
        return 'N/A'
      }
      return parseTime(time, '{y}-{m}-{d} {h}:{i}:{s}')
    },
    filterType(type) {
      const typeMap = {
        dashboard: '后端管理',
        portal: '门户网站',
        public: '公共'
      }
      return typeMap[type]
    },
    filterTagType(type) {
      const typeMap = {
        dashboard: 'primary',
        portal: 'success',
        public: 'info'
      }
      return typeMap[type]
    }
  },
  data() {
    return {
      listQuery: Object.assign({}, defaultListQuery),
      list: null,
      total: null,
      listLoading: false,
      dialogVisible: false,
      typeOptions: [
        { value: 'dashboard', label: '后端管理' },
        { value: 'portal', label: '门户网站' },
        { value: 'public', label: '公共' }
      ],
      resource: Object.assign({}, defaultResource),
      isEdit: false,
      categoryOptions: [],
      defaultCategoryId: null
    }
  },
  created() {
    this.getList()
    this.getCateList()
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
      this.resource = Object.assign({}, defaultResource)
      this.resource.categoryId = this.defaultCategoryId
    },
    handleDelete(index, row) {
      this.$confirm('是否要删除该资源权限?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deletePermissionById(row.id).then(response => {
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
      this.resource = Object.assign({}, row)
    },
    handleDialogConfirm() {
      this.$confirm('是否要确认?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (this.isEdit) {
          updatePermission(this.resource).then(response => {
            this.$message({
              message: '修改成功！',
              type: 'success'
            })
            this.dialogVisible = false
            this.getList()
          })
        } else {
          createPermission(this.resource).then(response => {
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
    handleShowCategory() {
      this.$router.push({ path: '/auth/permission/category' })
    },
    getList() {
      this.listLoading = true
      getPermissionByPage(this.listQuery).then(response => {
        this.listLoading = false
        this.list = response.data.records
        this.total = response.data.total
      })
    },
    getCateList() {
      getPermissionCate().then(response => {
        const cateList = response.data
        for (let i = 0; i < cateList.length; i++) {
          const cate = cateList[i]
          this.categoryOptions.push({ label: cate.name, value: cate.id })
        }
        this.defaultCategoryId = cateList[0].id
      })
    }
  }
}
</script>
<style></style>

