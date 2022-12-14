package com.ubiquitous.market.admin.api.api.category;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ubiquitous.market.biz.service.category.CategoryBizService;
import com.ubiquitous.market.data.component.CacheComponent;
import com.ubiquitous.market.data.domain.CategoryDO;
import com.ubiquitous.market.data.domain.SpuDO;
import com.ubiquitous.market.data.dto.CategoryTreeNodeDTO;
import com.ubiquitous.market.data.mapper.CategoryMapper;
import com.ubiquitous.market.data.mapper.SpuMapper;
import com.ubiquitous.market.data.model.Page;
import com.ubiquitous.market.plugin.core.inter.IPluginUpdateCategory;
import com.ubiquitous.market.plugin.core.manager.PluginsManager;
import com.ubiquitous.market.core.exception.AdminServiceException;
import com.ubiquitous.market.core.exception.AppServiceException;
import com.ubiquitous.market.core.exception.ExceptionDefinition;
import com.ubiquitous.market.core.exception.ServiceException;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by admin on 2019/7/12.
 */
@Service
public class AdminCategoryServiceImpl implements AdminCategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private SpuMapper spuMapper;

    @Autowired
    private CategoryBizService categoryBizService;

    @Autowired
    private CacheComponent cacheComponent;

    @Autowired
    private PluginsManager pluginsManager;

    private static final String CA_CATEGORY_TREE = "CA_CATEGORY_TREE";

    private static final String ADMIN_QUERY_CATEGORY_LIST = "ADMIN_QUERY_CATEGORY_LIST";

    private static final String CA_CATEGORY_SECOND_LEVEL_TREE = "CA_CATEGORY_SECOND_LEVEL_TREE";

    /**
     * @return
     * @throws ServiceException
     */


    /*?????????????????????*/
    public List<CategoryTreeNodeDTO> categorySecondLevelTree() throws ServiceException {
        List<CategoryTreeNodeDTO> objList = cacheComponent.getObjList(CA_CATEGORY_SECOND_LEVEL_TREE, CategoryTreeNodeDTO.class);
        if (objList != null) {
            return objList;
        }
        List<CategoryTreeNodeDTO> list = categoryBizService.categorySecondLevelTree();
        cacheComponent.putObj(CA_CATEGORY_SECOND_LEVEL_TREE, list, 60 * 60);
        return list;
    }


    /*????????????????????????*/
    //TODO ????????????
    @Override
    public List<CategoryTreeNodeDTO> categoryTree() throws ServiceException {
        List<CategoryTreeNodeDTO> objList = cacheComponent.getObjList(CA_CATEGORY_TREE, CategoryTreeNodeDTO.class);
        if (objList != null) {
            return objList;
        }
        List<CategoryDO> categoryDOS = categoryMapper.selectList(new EntityWrapper<>());
        List<CategoryTreeNodeDTO> list = categoryDOS.stream().filter((item) -> (item.getParentId().equals(0l))).map(item -> {
            CategoryTreeNodeDTO dto = new CategoryTreeNodeDTO();
            dto.setLabel(item.getTitle());
            dto.setLevel(0);
            dto.setFullName(dto.getLabel());
            dto.setValue(item.getId());
            dto.setChildren(new LinkedList<>());
            return dto;
        }).collect(Collectors.toList());
        list.forEach(item -> {
            categoryDOS.forEach(categoryDO -> {
                if (categoryDO.getParentId().equals(item.getValue())) {
                    CategoryTreeNodeDTO categoryTreeNodeDTO = new CategoryTreeNodeDTO();
                    categoryTreeNodeDTO.setChildren(new LinkedList<>());
                    categoryTreeNodeDTO.setValue(categoryDO.getId());
                    categoryTreeNodeDTO.setLabel(categoryDO.getTitle());
                    categoryTreeNodeDTO.setLevel(1);
                    categoryTreeNodeDTO.setParent(item.getValue());
                    categoryTreeNodeDTO.setFullName(item.getFullName() + "/" + categoryDO.getTitle());
                    item.getChildren().add(categoryTreeNodeDTO);
                    categoryDOS.forEach(subCategoryDO -> {
                        if (subCategoryDO.getParentId().equals(categoryTreeNodeDTO.getValue())) {
                            CategoryTreeNodeDTO childCategoryNodeDTO = new CategoryTreeNodeDTO();
                            childCategoryNodeDTO.setLabel(subCategoryDO.getTitle());
                            childCategoryNodeDTO.setValue(subCategoryDO.getId());
                            childCategoryNodeDTO.setLevel(2);
                            childCategoryNodeDTO.setParent(categoryTreeNodeDTO.getValue());
                            childCategoryNodeDTO.setFullName(categoryTreeNodeDTO.getFullName() + "/" + subCategoryDO.getTitle());
                            categoryTreeNodeDTO.getChildren().add(childCategoryNodeDTO);
                        }
                    });
                }
            });
        });
        cacheComponent.putObj(CA_CATEGORY_TREE, list, 60 * 60);
        return list;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public CategoryDO addCategory(Long adminId, String title, Long parentId, String iconUrl, String picUrl, Integer level) throws ServiceException {
        CategoryDO parent;
        CategoryDO categoryDO = new CategoryDO();
        if (!parentId.equals(0L)) {
            parent = categoryMapper.selectById(parentId);
            if (parent == null) {
                throw new AdminServiceException(ExceptionDefinition.PARENT_NODE_INFORMATION_ERROR);
            }
            categoryDO.setLevel(parent.getLevel() + 1);
        } else {
            categoryDO.setLevel(0);
        }
        //???????????????????????????????????????
        if (categoryDO.getLevel() > 2) {
            throw new AdminServiceException(ExceptionDefinition.MAX_SECOND_CATEGORY_ERROR);
        }
        categoryDO.setParentId(parentId);
        categoryDO.setIconUrl(iconUrl);
        categoryDO.setPicUrl(picUrl);
        categoryDO.setTitle(title);
        Date now = new Date();
        categoryDO.setGmtCreate(now);
        categoryDO.setGmtUpdate(now);

        if (categoryMapper.insert(categoryDO) <= 0) {
            throw new AdminServiceException(ExceptionDefinition.DATABASE_INSERT_FAILURE);
        }
        cacheComponent.del(CA_CATEGORY_TREE);
        cacheComponent.del(ADMIN_QUERY_CATEGORY_LIST);
        cacheComponent.del(CA_CATEGORY_SECOND_LEVEL_TREE);
        cacheComponent.del(CategoryBizService.CA_CATEGORY_ID_HASH);
        cacheComponent.del(CategoryBizService.CA_CATEGORY_LIST);
        pluginInvokeUpdateCategory(categoryDO.getId());
        return categoryDO;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteCategory(Long adminId, Long id) throws ServiceException {
        Integer count_category = categoryMapper.selectCount(new EntityWrapper<CategoryDO>().eq("parent_id", id));
        Integer count_spu = spuMapper.selectCount(new EntityWrapper<SpuDO>().eq("category_id", id));

        if (count_category != 0 || count_spu != 0) {
            throw new AppServiceException(ExceptionDefinition.CATEGORY_OUGHT_TO_EMPTY);
        }
        cacheComponent.del(CA_CATEGORY_TREE);
        cacheComponent.del(ADMIN_QUERY_CATEGORY_LIST);
        cacheComponent.del(CA_CATEGORY_SECOND_LEVEL_TREE);
        cacheComponent.del(CategoryBizService.CA_CATEGORY_ID_HASH);
        cacheComponent.del(CategoryBizService.CA_CATEGORY_LIST);
        pluginInvokeUpdateCategory(id);
        return categoryMapper.deleteById(id) > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public CategoryTreeNodeDTO updateCategory(Long adminId, Long id, String title, Long parentId, String iconUrl, String picUrl, Integer level) throws ServiceException {
        CategoryDO categoryDO = new CategoryDO();
        if (id == null || parentId == null) {
            throw new AdminServiceException(ExceptionDefinition.CATEGORY_OR_PARENT_NODE_IS_EMPTY);
        }
        categoryDO.setId(parentId);
        CategoryDO categoryParent = categoryMapper.selectOne(categoryDO);

        //???????????????????????????????????????
        if (id.equals(parentId)) {
            throw new AdminServiceException(ExceptionDefinition.PARENT_CAN_NOT_EQUALS_ONESELF);
        }

        if (categoryParent == null && !parentId.equals(0L)) {
            throw new AdminServiceException(ExceptionDefinition.NOT_FIND_PARENT_NODE);
        }
        if (parentId.equals(0L)) {
            categoryDO.setLevel(0);
        } else {
            categoryDO.setLevel(categoryParent.getLevel() + 1);
        }
        categoryDO.setId(id);
        categoryDO.setGmtUpdate(new Date());
        categoryDO.setParentId(parentId);
        categoryDO.setTitle(title);
        categoryDO.setPicUrl(picUrl);
        categoryDO.setIconUrl(iconUrl);
        if (categoryMapper.updateById(categoryDO) <= 0) {
            throw new AdminServiceException(ExceptionDefinition.CATEGORY_UPDATE_FAILURE);
        }
        CategoryTreeNodeDTO categoryTreeNodeDTO = new CategoryTreeNodeDTO();
        List<CategoryTreeNodeDTO> list = getCategoryList();
        for (CategoryTreeNodeDTO temp : list) {
            if (categoryDO.getId().equals(temp.getValue())) {
                BeanUtils.copyProperties(temp, categoryTreeNodeDTO);
                break;
            }
        }
        cacheComponent.del(CA_CATEGORY_TREE);
        cacheComponent.del(ADMIN_QUERY_CATEGORY_LIST);
        cacheComponent.del(CA_CATEGORY_SECOND_LEVEL_TREE);
        cacheComponent.del(CategoryBizService.CA_CATEGORY_ID_HASH);
        cacheComponent.del(CategoryBizService.CA_CATEGORY_LIST);
        pluginInvokeUpdateCategory(categoryDO.getId());
        return categoryTreeNodeDTO;
    }

    //??????????????????????????????List<CategoryTreeNodeDTO>,?????????SQL???????????????????????????????????????????????????
    @Override
    public Page<CategoryTreeNodeDTO> queryCategory(Long adminId, Long id, String title, Integer level, Long parentId, Integer pageNo, Integer limit) throws ServiceException {
        EntityWrapper wrapper = new EntityWrapper();
        if (id != null) {
            wrapper.eq("id", id);
        }
        if (title != null) {
            wrapper.like("title", title);
        }
        if (level != null) {
            wrapper.eq("level", level);
        }
        if (parentId != null) {
            wrapper.eq("parent_id", parentId);
        }
        wrapper.orderBy("level");
        Integer count = categoryMapper.selectCount(wrapper);

        List<CategoryDO> categoryDOS = categoryMapper.selectPage(new RowBounds((pageNo - 1) * limit, limit), wrapper);
        List<CategoryTreeNodeDTO> totalCategory = getCategoryList();
        List<CategoryTreeNodeDTO> list = categoryDOS.stream().map(item -> {
            CategoryTreeNodeDTO dto = new CategoryTreeNodeDTO();
            for (CategoryTreeNodeDTO temp : totalCategory) {
                if (temp.getValue().equals(item.getId())) {
                    BeanUtils.copyProperties(temp, dto);
                    return dto;
                }
            }
            BeanUtils.copyProperties(item, dto);
            ;
            return dto;
        }).collect(Collectors.toList());
        Page<CategoryTreeNodeDTO> page = new Page<>(list, pageNo, limit, count);
        return page;
    }


    //TODO ??????????????????????????????????????????
    //????????????????????????????????????????????????list,
    private List<CategoryTreeNodeDTO> getCategoryList() {
        List<CategoryTreeNodeDTO> objList = cacheComponent.getObjList(ADMIN_QUERY_CATEGORY_LIST, CategoryTreeNodeDTO.class);
        if (objList != null) {
            return objList;
        }
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.orderBy("level");
        List<CategoryDO> categoryDOS = categoryMapper.selectList(wrapper);
        List<CategoryTreeNodeDTO> list = categoryDOS.stream().map(item -> {
            CategoryTreeNodeDTO dto = new CategoryTreeNodeDTO();
            dto.setLabel(item.getTitle());
            dto.setLevel(item.getLevel());
            dto.setValue(item.getId());
            dto.setParent(item.getParentId());
            dto.setIconUrl(item.getIconUrl());
            dto.setPicUrl(item.getPicUrl());
            if (item.getLevel() == 0) {
                dto.setFullName(dto.getLabel());
            }
            return dto;
        }).collect(Collectors.toList());

        for (CategoryTreeNodeDTO cOne : list) {

            for (CategoryTreeNodeDTO cTwo : list) {
                if (cOne.getParent().equals(cTwo.getValue())) {
                    cOne.setFullName(cTwo.getFullName() + "/" + cOne.getLabel());
                    break;
                }
            }

        }
        cacheComponent.putObj(ADMIN_QUERY_CATEGORY_LIST, list, 60 * 60);
        return list;
    }

    private void pluginInvokeUpdateCategory(Long categoryId) {
        List<IPluginUpdateCategory> plugins = pluginsManager.getPlugins(IPluginUpdateCategory.class);
        if (!CollectionUtils.isEmpty(plugins)) {
            for (IPluginUpdateCategory updateGoods : plugins) {
                updateGoods.invokeCategoryUpdate(categoryId);
            }
        }
    }


}
