package com.yaolong.rbac.commons.base;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @program: yaolong-blog
 * @description: 通用Dto
 * @author: yaolong
 * @create: 2020-08-14 19:47
 **/
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class BaseDto implements Serializable {

	private static final long serialVersionUID = 8240688522058859728L;

	/**
	 * 主键
	 */
	private Long id;

	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime createTime;

	/**
	 * 修改时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime updateTime;

}
