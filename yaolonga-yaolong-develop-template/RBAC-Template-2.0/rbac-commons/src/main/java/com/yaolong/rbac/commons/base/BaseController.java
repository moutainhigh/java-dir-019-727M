package com.yaolong.rbac.commons.base;

import com.baomidou.mybatisplus.core.metadata.IPage;

import com.yaolong.rbac.commons.annotation.SysLog;
import com.yaolong.rbac.commons.response.ResponseCode;
import com.yaolong.rbac.commons.response.ResponseResult;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * 通用请求处理
 *
 * @author Yaolong
 * @since v1.0.0
 */
@SuppressWarnings("all")
public abstract class BaseController<T extends BaseDomain, S extends IBaseService<T>> {

	@Resource
	protected HttpServletRequest request;

	@Autowired
	protected S service;

	/**
	 * 新增
	 * @param domain 领域模型
	 * @return {@link ResponseResult}
	 */
	@PostMapping("")
	@ApiOperation(value = "新增", notes = "新增")
	@SysLog(value = "新增")
	public ResponseResult create(@Valid @RequestBody T domain) {
		// 业务逻辑
		boolean created = service.create(domain);
		if (created) {
			return ResponseResult.success("创建成功");
		}

		return ResponseResult.failure(ResponseCode.INTERFACE_ADDRESS_INVALID);
	}

	/**
	 * 删除
	 * @param id {@code Long}
	 * @return {@link ResponseResult}
	 */
	@DeleteMapping("{id}")
	@ApiOperation(value = "删除", notes = "删除")
	@SysLog(value = "删除")
	public ResponseResult remove(@PathVariable Long id) {
		// 业务逻辑
		boolean deleted = service.remove(id);
		if (deleted) {
			return ResponseResult.success("删除成功");
		}

		return ResponseResult.failure(ResponseCode.INTERFACE_ADDRESS_INVALID);
	}

	/**
	 * 修改
	 * @param domain 领域模型
	 * @return {@link ResponseResult}
	 */
	@PutMapping("")
	@ApiOperation(value = "修改", notes = "修改")
	@SysLog(value = "修改")
	public ResponseResult update(@Valid @RequestBody T domain) {
		System.out.println(domain);
		// 业务逻辑
		boolean updated = service.update(domain);
		if (updated) {
			return ResponseResult.success("编辑成功");
		}

		return ResponseResult.failure(ResponseCode.INTERFACE_ADDRESS_INVALID);
	}

	/**
	 * 获取
	 * @param id {@code Long}
	 * @return {@link ResponseResult}
	 */
	@GetMapping("{id}")
	@ApiOperation(value = "根据id获取", notes = "根据id获取")
	@SysLog(value = "根据id获取")
	public ResponseResult get(@PathVariable Long id) {
		T domain = service.get(id);
		return ResponseResult.success(domain);
	}

	/**
	 * 分页
	 * @param current {@code int} 页码
	 * @param size {@code int} 笔数
	 * @return {@link ResponseResult}
	 */
	@GetMapping("page")
	@ApiOperation(value = "分页查询", notes = "分页查询")
	@SysLog(value = "分页查询")
	public ResponseResult page(@RequestParam int current, @RequestParam int size, @ModelAttribute T domain) {
		IPage<?> page = service.page(current, size, domain);
		return ResponseResult.success(page);
	}


	/**
	 * 获取列表
	 * @param domain
	 * @return {@link ResponseResult}
	 */
	@GetMapping("list")
	@ApiOperation(value = "获取列表", notes = "获取列表")
	@SysLog(value = "获取列表")
	public ResponseResult list( @ModelAttribute T domain) {
		List<T> lsit = service.list(domain);
		return ResponseResult.success(lsit);
	}


}
