package com.yaolong.rbac.jwt.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yaolong.rbac.commons.exceptions.BusinessException;
import com.yaolong.rbac.commons.utils.MapperUtils;
import com.yaolong.rbac.jwt.domain.SysDept;
import com.yaolong.rbac.jwt.dto.vbenAdmin.DeptDto;
import com.yaolong.rbac.jwt.dto.vbenAdmin.DeptNode;
import com.yaolong.rbac.jwt.mapper.SysDeptMapper;
import com.yaolong.rbac.jwt.service.ISysDeptService;
import com.yaolong.rbac.commons.base.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author yaolong
 * @since 2021-08-08
 */
@Service
public class SysDeptServiceImpl extends BaseServiceImpl<SysDeptMapper, SysDept> implements ISysDeptService {


    @Override
    public boolean remove(Long id) {

        LambdaQueryWrapper<SysDept> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysDept::getParentId, id);
        List<SysDept> list = super.list(wrapper);
        if (!ObjectUtil.isEmpty(list) && list.size() > 0) {
            throw new BusinessException("当前部门下存在子部门，请删除子部门");
        }
        return super.remove(id);
    }

    @Override
    public List<DeptNode> treeList(SysDept domain) {
        LambdaQueryWrapper<SysDept> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(!ObjectUtil.isEmpty(domain.getName()), SysDept::getName, domain.getName())
                .eq(!ObjectUtil.isEmpty(domain.getStatus()), SysDept::getStatus, domain.getStatus());
        List<SysDept> list = baseMapper.selectList(wrapper).stream().filter(d -> !d.getStatus()).collect(Collectors.toList());
        if (list.size() > 0) {
            //如果MenuName为空就不查子
            if (!ObjectUtil.isEmpty(domain.getName())) {
                list.addAll(getChildrenDeptList(list, domain));
            }
            return generateTree(list, getMaxParentId(list));
        }
        return new ArrayList<>();
    }

    @Override
    public List<SysDept> getListByRoleId(Long roleId) {
        try {
            List<SysDept> depts = baseMapper.getDeptListByRoleId(roleId).stream().filter(ObjectUtil::isNotEmpty).collect(Collectors.toList());

            //找到所有父id
            List<Long> pids = depts.stream().map(SysDept::getParentId).distinct().collect(Collectors.toList());

            return depts.stream().filter(d->!pids.contains(d.getId())).collect(Collectors.toList());
        }catch (Exception e){
            e.printStackTrace();
            throw new  BusinessException("获取部门列表实现白");
        }
    }

    /**
     * @param depts
     * @description 获取孩子菜单列表
     * @author yaolong
     * @date 2021/8/6 10:41
     */
    private List<SysDept> getChildrenDeptList(List<SysDept> depts, SysDept dept) {
        //新建一个list实例防止list并发修改异常
        List<SysDept> dept2 = new ArrayList<>();
        //如果有孩子节点就把孩子节点查出来
        depts.forEach(item -> {
            LambdaQueryWrapper<SysDept> wrapper2 = new LambdaQueryWrapper<>();
            wrapper2.eq(SysDept::getParentId, item.getId()).eq(!ObjectUtil.isEmpty(dept.getStatus()), SysDept::getStatus, dept.getStatus());
            dept2.addAll(baseMapper.selectList(wrapper2));
            dept2.addAll(getChildrenDeptList(dept2, dept));
        });
        return dept2;
    }


    /**
     * @param depts
     * @return void
     * @description 获取最大的pid (此处的最大pid是越小级别越大)
     * @author yaolong
     * @date 2021/8/6 11:19
     */
    private Long getMaxParentId(List<SysDept> depts) {
        List<Long> collect = depts.stream().sorted(Comparator.comparing(SysDept::getParentId)).map(SysDept::getParentId).collect((Collectors.toList()));
        return collect.get(0);
    }

    /**
     * 生成树
     *
     * @param depts
     * @param startId 开始生成的id
     * @return
     */
    public List<DeptNode> generateTree(List<SysDept> depts, Long startId) {
        List<DeptDto> deptDtos = MapperUtils.copyList(depts, DeptDto.class);
        return deptDtos.stream()
                .filter(subDept -> subDept.getParentId().equals(startId))
                .map(dept -> recursion(dept, deptDtos)).sorted(Comparator.comparing(DeptDto::getOrderNo))
                .collect(Collectors.toList());
    }

    /**
     * 递归拼接生成树
     *
     * @param deptDto
     * @param deptDtos
     * @return
     */
    private DeptNode recursion(DeptDto deptDto, List<DeptDto> deptDtos) {
        DeptNode deptNode = MapperUtils.copy(deptDto, new DeptNode());
        try {
            List<DeptNode> nodes = deptDtos.stream()
                    .filter(sub -> sub.getParentId().equals(deptDto.getId()))
                    .map(dept -> recursion(dept, deptDtos))
                    .collect(Collectors.toList());
            deptNode.setChildren(nodes.size() > 0 ? nodes : null);
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("递归异常" + e.getMessage());
        }
        return deptNode;
    }
}
