package com.ubiquitous.market.data.dto.freight;

import com.ubiquitous.market.data.domain.FreightTemplateCarriageDO;
import com.ubiquitous.market.data.domain.FreightTemplateDO;
import com.ubiquitous.market.data.dto.SuperDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 *
 * Description:
 * User: admin
 * Date: 2019-07-07
 * Time: 下午3:09
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class FreightTemplateDTO extends SuperDTO {

    private FreightTemplateDO freightTemplateDO;

    private List<FreightTemplateCarriageDO> freightTemplateCarriageDOList;

}
