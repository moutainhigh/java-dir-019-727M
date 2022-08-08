package com.ubiquitous.market.app.api.api.recommend;

import com.ubiquitous.market.biz.service.recommend.RecommendBizService;
import com.ubiquitous.market.core.exception.ServiceException;
import com.ubiquitous.market.data.dto.RecommendDTO;
import com.ubiquitous.market.data.model.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 *
 * Description:
 * User: admin
 * Date: 2019-07-08
 * Time: 下午3:40
 * @author kaixin
 */
@Service
public class RecommendServiceImpl implements RecommendService {

    @Resource
    private RecommendBizService recommendBizService;

    @Override
    public Page<RecommendDTO> getRecommendByStorage(Long storageId, Integer recommedType, Integer pageNo, Integer pageSize) throws ServiceException {
        return recommendBizService.getRecommendByType(storageId,recommedType,pageNo,pageSize);
    }
}
