package com.yanxiuhair.framework.filter;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
 
/**
 * @ClassName:  ParamsFilter   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author: gaoxiaochuang   
 * @date:   2020年11月3日 上午8:22:32   
 *     
 * @Copyright: 2020 http://www.yanxiuhair.com/ Inc. All rights reserved. 
 * 注意：本内容仅限于许昌妍秀发制品有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Component
@WebFilter(urlPatterns = "/**", filterName = "ParamsFilter", dispatcherTypes = DispatcherType.REQUEST)
public class ParamsFilter implements Filter {
 
    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
            throws IOException, ServletException {
        ParameterRequestWrapper parmsRequest = new ParameterRequestWrapper((HttpServletRequest) arg0);
        arg2.doFilter(parmsRequest, arg1);
    }
 
    @Override
    public void destroy() {
 
    }
 
    @Override
    public void init(FilterConfig arg0) {
 
    }
 
 
}
