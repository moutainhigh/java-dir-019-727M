package com.ubiquitous.market.rider.admin.api;

import com.ubiquitous.market.core.annotation.HttpMethod;
import com.ubiquitous.market.core.annotation.HttpOpenApi;
import com.ubiquitous.market.core.annotation.HttpParam;
import com.ubiquitous.market.core.annotation.HttpParamType;
import com.ubiquitous.market.core.annotation.param.NotNull;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.domain.RiderDO;
import com.ubiquitous.market.data.dto.RiderCycleDTO;
import com.ubiquitous.market.data.dto.rider.RiderDTO;
import com.ubiquitous.market.data.dto.rider.RiderMapDTO;
import com.ubiquitous.market.data.model.Page;

import java.util.List;

@HttpOpenApi(group = "admin.rider", description = "配送服务")
public interface RiderService {

    @HttpMethod(description = "列表", permission = "admin.rider:list", permissionParentName = "配送员管理", permissionName = "配送员配送管理")
    public Page<RiderDO> list(
            @HttpParam(name = "state", type = HttpParamType.COMMON, description = "配送员状态[0:禁用，1：正常]") Integer state,
            @HttpParam(name = "workState", type = HttpParamType.COMMON, description = "开工状态[0:休息，1:开工]") Integer workState,
            @HttpParam(name = "name", type = HttpParamType.COMMON, description = "配送员姓名") String name,
            @HttpParam(name = "phone", type = HttpParamType.COMMON, description = "配送员电话") String phone,
            @HttpParam(name = "storageId", type = HttpParamType.COMMON, description = "仓库主键ID") Long storageId,
            @HttpParam(name = "page", type = HttpParamType.COMMON, description = "页码", valueDef = "1") Integer page,
            @HttpParam(name = "limit", type = HttpParamType.COMMON, description = "页码长度", valueDef = "20") Integer limit,
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId) throws ServiceException;

    @HttpMethod(description = "根据仓库主键ID获取正常开工的配送员")
    public List<RiderDO> getRiderByStorageId(
            @HttpParam(name = "storageId", type = HttpParamType.COMMON, description = "仓库主键ID") Long storageId,
            @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId) throws ServiceException;

    @HttpMethod(description = "根据主键ID获取配送员详情")
    public RiderDTO getDetailById(
            @NotNull @HttpParam(name = "id", type = HttpParamType.COMMON, description = "配送员主键ID") Long id,
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId) throws ServiceException;

    @HttpMethod(description = "添加", permission = "admin.rider:create", permissionParentName = "配送员配送管理", permissionName = "配送员配送管理")
    public RiderDO create(
            @NotNull @HttpParam(name = "riderDTO", type = HttpParamType.COMMON, description = "配送员对象") RiderCycleDTO riderCycleDTO,
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId) throws ServiceException;

    @HttpMethod(description = "更新", permission = "admin.rider:update", permissionParentName = "配送员配送管理", permissionName = "配送员配送管理")
    public RiderDO update(
            @NotNull @HttpParam(name = "rider", type = HttpParamType.COMMON, description = "配送员对象") RiderCycleDTO riderCycleDTO,
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId) throws ServiceException;

    @HttpMethod(description = "配送员状态批量更新为正常", permission = "admin.rider:batchToNomral", permissionParentName = "配送员配送管理", permissionName = "配送员配送管理")
    public String updateStateToNomral(
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId,
            @NotNull @HttpParam(name = "ids", type = HttpParamType.COMMON, description = "配送员主键数组Json字符串") String idsJson) throws ServiceException;

    @HttpMethod(description = "配送员状态批量更新为禁用", permission = "admin.rider:batchToAbort", permissionParentName = "配送员配送管理", permissionName = "配送员配送管理")
    public String updateStateToAbort(
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId,
            @NotNull @HttpParam(name = "ids", type = HttpParamType.COMMON, description = "配送员主键数组Json字符串") String idsJson) throws ServiceException;

    @HttpMethod(description = "配送员工作状态批量更新为开工中", permission = "admin.rider:batchToOpen", permissionParentName = "配送员配送管理", permissionName = "配送员配送管理")
    public String updateBusinessWorkState(
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId,
            @NotNull @HttpParam(name = "ids", type = HttpParamType.COMMON, description = "配送员主键数组Json字符串") String idsJson) throws ServiceException;

    @HttpMethod(description = "配送员工作状态批量更新为休息中", permission = "admin.rider:batchToRest", permissionParentName = "配送员管理", permissionName = "配送员配送管理")
    public String updateBusinessStateToRest(
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId,
            @NotNull @HttpParam(name = "ids", type = HttpParamType.COMMON, description = "配送员主键数组Json字符串") String idsJson) throws ServiceException;

    @HttpMethod(description = "配送员配送枚举")
    public List<RiderMapDTO> options(
            @HttpParam(name = "storageId", type = HttpParamType.COMMON, description = "仓库主键ID") Long storageId,
            @NotNull @HttpParam(name = "adminId", type = HttpParamType.ADMIN_ID, description = "管理员ID") Long adminId) throws ServiceException;
}
