package com.yanxiuhair.generator.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.yanxiuhair.common.annotation.Log;
import com.yanxiuhair.common.core.controller.BaseController;
import com.yanxiuhair.common.core.domain.AjaxResult;
import com.yanxiuhair.common.core.domain.CxSelect;
import com.yanxiuhair.common.core.page.EasyUITableDataInfo;
import com.yanxiuhair.common.core.page.TableDataInfo;
import com.yanxiuhair.common.core.text.Convert;
import com.yanxiuhair.common.enums.BusinessType;
import com.yanxiuhair.common.utils.StringUtils;
import com.yanxiuhair.common.utils.security.PermissionUtils;
import com.yanxiuhair.generator.domain.GenTable;
import com.yanxiuhair.generator.domain.GenTableColumn;
import com.yanxiuhair.generator.service.IGenTableColumnService;
import com.yanxiuhair.generator.service.IGenTableService;

/**
 * @ClassName:  GenController   
 * @Description: 代码生成 操作处理   
 * @author: gaoxiaochuang   
 * @date:   2021年7月1日 下午4:52:53   
 *     
 * @Copyright: 2021 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Controller
@RequestMapping("/tool/gen")
public class GenController extends BaseController {
	private String prefix = "tool/gen";

	@Autowired
	private IGenTableService genTableService;

	@Autowired
	private IGenTableColumnService genTableColumnService;

	@RequiresPermissions("tool:gen:view")
	@GetMapping()
	public String gen() {
		return prefix + "/gen";
	}

	/**
	 * 查询代码生成列表
	 */
	@RequiresPermissions("tool:gen:list")
	@PostMapping("/list")
	@ResponseBody
	public EasyUITableDataInfo genList(GenTable genTable) {
		easyUIStartPage();
		List<GenTable> list = genTableService.selectGenTableList(genTable);
		return getEasyUIDataTable(list);
	}

	/**
	 * 查询数据库列表
	 */
	@RequiresPermissions("tool:gen:list")
	@PostMapping("/db/list")
	@ResponseBody
	public EasyUITableDataInfo dataList(GenTable genTable) {
		easyUIStartPage();
		List<GenTable> list = genTableService.selectDbTableList(genTable);
		return getEasyUIDataTable(list);
	}

	/**
	 * 查询数据表字段列表
	 */
	@RequiresPermissions("tool:gen:list")
	@PostMapping("/column/list")
	@ResponseBody
	public TableDataInfo columnList(GenTableColumn genTableColumn) {
		TableDataInfo dataInfo = new TableDataInfo();
		List<GenTableColumn> list = genTableColumnService.selectGenTableColumnListByTableId(genTableColumn);
		dataInfo.setRows(list);
		dataInfo.setTotal(list.size());
		return dataInfo;
	}

	/**
	 * 导入表结构
	 */
	@RequiresPermissions("tool:gen:list")
	@GetMapping("/importTable")
	public String importTable() {
		return prefix + "/importTable";
	}

	/**
	 * 导入表结构（保存）
	 */
	@RequiresPermissions("tool:gen:list")
	@Log(title = "代码生成", businessType = BusinessType.IMPORT)
	@PostMapping("/importTable")
	@ResponseBody
	public AjaxResult importTableSave(String tables) {
		String[] tableNames = Convert.toStrArray(tables);
		// 查询表信息
		List<GenTable> tableList = genTableService.selectDbTableListByNames(tableNames);
		String operName = (String) PermissionUtils.getPrincipalProperty("loginName");
		genTableService.importGenTable(tableList, operName);
		return AjaxResult.success();
	}

	/**
	 * 修改代码生成业务
	 */
	@GetMapping("/edit/{tableId}")
	public String edit(@PathVariable("tableId") Long tableId, ModelMap mmap) {
		GenTable table = genTableService.selectGenTableById(tableId);
		List<GenTable> genTables = genTableService.selectGenTableAll();
		List<CxSelect> cxSelect = new ArrayList<CxSelect>();
		for (GenTable genTable : genTables) {
			if (!StringUtils.equals(table.getTableName(), genTable.getTableName())) {
				CxSelect cxTable = new CxSelect(genTable.getTableName(),
						genTable.getTableName() + '：' + genTable.getTableComment());
				List<CxSelect> cxColumns = new ArrayList<CxSelect>();
				for (GenTableColumn tableColumn : genTable.getColumns()) {
					cxColumns.add(new CxSelect(tableColumn.getColumnName(),
							tableColumn.getColumnName() + '：' + tableColumn.getColumnComment()));
				}
				cxTable.setS(cxColumns);
				cxSelect.add(cxTable);
			}
		}
		mmap.put("table", table);
		mmap.put("data", JSON.toJSON(cxSelect));
		return prefix + "/edit";
	}

	/**
	 * 修改保存代码生成业务
	 */
	@RequiresPermissions("tool:gen:edit")
	@Log(title = "代码生成", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(@Validated GenTable genTable) {
		genTableService.validateEdit(genTable);
		genTableService.updateGenTable(genTable);
		return AjaxResult.success();
	}

	@RequiresPermissions("tool:gen:remove")
	@Log(title = "代码生成", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
	@ResponseBody
	public AjaxResult remove(String ids) {
		genTableService.deleteGenTableByIds(ids);
		return AjaxResult.success();
	}

	/**
	 * 预览代码
	 */
	@RequiresPermissions("tool:gen:preview")
	@GetMapping("/preview/{tableId}")
	@ResponseBody
	public AjaxResult preview(@PathVariable("tableId") Long tableId) throws IOException {
		Map<String, String> dataMap = genTableService.previewCode(tableId);
		return AjaxResult.success(dataMap);
	}

	/**
	 * 生成代码（下载方式）
	 */
	@RequiresPermissions("tool:gen:code")
	@Log(title = "代码生成", businessType = BusinessType.GENCODE)
	@GetMapping("/download/{tableName}")
	public void download(HttpServletResponse response, @PathVariable("tableName") String tableName) throws IOException {
		byte[] data = genTableService.downloadCode(tableName);
		genCode(response, data);
	}

	/**
	 * 生成代码（自定义路径）
	 */
	@RequiresPermissions("tool:gen:code")
	@Log(title = "代码生成", businessType = BusinessType.GENCODE)
	@GetMapping("/genCode/{tableName}")
	@ResponseBody
	public AjaxResult genCode(@PathVariable("tableName") String tableName) {
		genTableService.generatorCode(tableName);
		return AjaxResult.success();
	}

	/**
	 * 同步数据库
	 */
	@RequiresPermissions("tool:gen:edit")
	@Log(title = "代码生成", businessType = BusinessType.UPDATE)
	@GetMapping("/synchDb/{tableName}")
	@ResponseBody
	public AjaxResult synchDb(@PathVariable("tableName") String tableName) {
		genTableService.synchDb(tableName);
		return AjaxResult.success();
	}

	/**
	 * 批量生成代码
	 */
	@RequiresPermissions("tool:gen:code")
	@Log(title = "代码生成", businessType = BusinessType.GENCODE)
	@GetMapping("/batchGenCode")
	@ResponseBody
	public void batchGenCode(HttpServletResponse response, String tables) throws IOException {
		String[] tableNames = Convert.toStrArray(tables);
		byte[] data = genTableService.downloadCode(tableNames);
		genCode(response, data);
	}

	/**
	 * 生成zip文件
	 */
	private void genCode(HttpServletResponse response, byte[] data) throws IOException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		response.reset();
		response.setHeader("Content-Disposition", "attachment; filename=\"yanxiuhair_"+formatter.format(new Date())+".zip\"");
		response.addHeader("Content-Length", "" + data.length);
		response.setContentType("application/octet-stream; charset=UTF-8");
		IOUtils.write(data, response.getOutputStream());
	}
}