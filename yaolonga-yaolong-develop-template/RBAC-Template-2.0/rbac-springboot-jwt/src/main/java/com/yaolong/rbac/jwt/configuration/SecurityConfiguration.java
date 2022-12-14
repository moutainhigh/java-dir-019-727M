package com.yaolong.rbac.jwt.configuration;

import com.yaolong.rbac.jwt.component.DynamicAccessDecisionManager;
import com.yaolong.rbac.jwt.component.DynamicSecurityFilter;
import com.yaolong.rbac.jwt.component.DynamicSecurityMetadataSource;
import com.yaolong.rbac.jwt.component.DynamicSecurityService;
import com.yaolong.rbac.jwt.component.JwtAuthenticationTokenFilter;
import com.yaolong.rbac.jwt.component.RestAuthenticationEntryPoint;
import com.yaolong.rbac.jwt.component.RestfulAccessDeniedHandler;
import com.yaolong.rbac.jwt.configuration.properties.IgnoreResourcePathProperties;
import com.yaolong.rbac.jwt.domain.SysPermission;
import com.yaolong.rbac.jwt.service.ISysPermissionService;
import com.yaolong.rbac.jwt.service.impl.SysUserDetailServiceImpl;
import com.yaolong.rbac.jwt.util.JwtTokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @program: study-project
 * @description: security????????????
 * @author: yaolong
 * @create: 2021-05-11 14:52
 **/
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, jsr250Enabled = true, securedEnabled = true)
@Slf4j
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired(required = false)
    private DynamicSecurityService dynamicSecurityService;

    @Autowired
    protected SysUserDetailServiceImpl studyUserDetailService;

    @Autowired
    private RestAuthenticationEntryPoint restAuthenticationEntryPoint;

    @Autowired
    private RestfulAccessDeniedHandler restfulAccessDeniedHandler;

    @Resource
    private ISysPermissionService studyPermissionService;

    /**
     * Description:????????????????????????
     *
     * @param http
     * @author huangweicheng
     * @date 2019/10/21
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {

        //????????????
        http.headers().frameOptions().disable();
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry = http
                .authorizeRequests();

        //??????????????????????????????????????????
        for (String url : ignoreResourcePathProperties().getPaths()) {
            registry.antMatchers(url).permitAll();
        }
        /*???????????????????????????????????????????????????*/
        //?????????????????????OPTIONS??????
        registry.antMatchers(HttpMethod.OPTIONS)
                .permitAll();
        // ??????????????????????????????
        registry.and()
                .authorizeRequests()
                .anyRequest()
                .authenticated()
                // ????????????????????????????????????session
                .and()
                .csrf()
                .disable()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                // ??????????????????????????????
                .and()
                .exceptionHandling()
                .accessDeniedHandler(restfulAccessDeniedHandler)
                .authenticationEntryPoint(restAuthenticationEntryPoint)
                // ????????????????????????JWT?????????
                .and()
                .addFilterBefore(jwtAuthenticationTokenFilter(), UsernamePasswordAuthenticationFilter.class);
        //?????????????????????????????????????????????????????????
        if(dynamicSecurityService!=null){
            registry.and().addFilterBefore(dynamicSecurityFilter(), FilterSecurityInterceptor.class);
        }
    }


    @Bean
    public DynamicSecurityService dynamicSecurityService() {
        return new DynamicSecurityService() {
            @Override
            public Map<String, ConfigAttribute> loadDataSource() {
                Map<String, ConfigAttribute> map = new ConcurrentHashMap<>();
                List<SysPermission> permissionList = studyPermissionService.getAll();
                for (SysPermission permission : permissionList) {
                    map.put(permission.getPath(), new org.springframework.security.access.SecurityConfig(permission.getId() + ":" + permission.getName()));
                }
                return map;
            }
        };
    }

    @Override
    protected void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(studyUserDetailService).passwordEncoder(passwordEncoder());
    }

    // ????????????
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //token?????????
    @Bean
    public JwtAuthenticationTokenFilter jwtAuthenticationTokenFilter() {
        return new JwtAuthenticationTokenFilter();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public IgnoreResourcePathProperties ignoreResourcePathProperties() {
        return new IgnoreResourcePathProperties();
    }

    @Bean
    public JwtTokenUtil jwtTokenUtil() {
        return new JwtTokenUtil();
    }

    @ConditionalOnBean(name = "dynamicSecurityService")
    @Bean
    public DynamicAccessDecisionManager dynamicAccessDecisionManager() {
        return new DynamicAccessDecisionManager();
    }


    @ConditionalOnBean(name = "dynamicSecurityService")
    @Bean
    public DynamicSecurityFilter dynamicSecurityFilter() {
        return new DynamicSecurityFilter();
    }

    @ConditionalOnBean(name = "dynamicSecurityService")
    @Bean
    public DynamicSecurityMetadataSource dynamicSecurityMetadataSource() {
        return new DynamicSecurityMetadataSource();
    }
}
