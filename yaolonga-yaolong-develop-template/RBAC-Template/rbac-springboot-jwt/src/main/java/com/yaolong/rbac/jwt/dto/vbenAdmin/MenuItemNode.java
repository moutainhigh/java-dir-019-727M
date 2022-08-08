package com.yaolong.rbac.jwt.dto.vbenAdmin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @program: study-project
 * @description: 菜单节点
 * @author: yaolong
 * @create: 2021-05-15 11:15
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class MenuItemNode extends MenuItemDto {

    List<MenuItemNode> children;
}
