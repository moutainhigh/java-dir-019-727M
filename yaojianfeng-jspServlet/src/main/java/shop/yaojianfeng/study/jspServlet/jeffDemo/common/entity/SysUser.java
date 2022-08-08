package shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * 系统用户表(SysUser)实体类
 *
 * @author makejava
 * @since 2021-12-12 16:31:19
 */
public class SysUser implements Serializable {
    private static final long serialVersionUID = -60679697319676578L;
    /**
     * 用户id
     */
    private String userId;
    /**
     * 登录名
     */
    private String loginName;
    /**
     * 用户名称
     */
    private String userName;
    /**
     * 登录密码
     */
    private String password;
    /**
     * 软删除标识，Y/N
     */
    private String valid;
    /**
     * 限制允许登录的IP集合
     */
    private String limitedIp;
    /**
     * 账号失效时间，超过时间将不能登录系统
     */
    private Date expiredTime;
    /**
     * 最近修改密码时间，超出时间间隔，提示用户修改密码
     */
    private Date lastChangePwdTime;
    /**
     * 是否允许账号同一个时刻多人在线，Y/N
     */
    private String limitMultiLogin;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date updateTime;

    public SysUser() {
    }

    public SysUser(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public String getLimitedIp() {
        return limitedIp;
    }

    public void setLimitedIp(String limitedIp) {
        this.limitedIp = limitedIp;
    }

    public Date getExpiredTime() {
        return expiredTime;
    }

    public void setExpiredTime(Date expiredTime) {
        this.expiredTime = expiredTime;
    }

    public Date getLastChangePwdTime() {
        return lastChangePwdTime;
    }

    public void setLastChangePwdTime(Date lastChangePwdTime) {
        this.lastChangePwdTime = lastChangePwdTime;
    }

    public String getLimitMultiLogin() {
        return limitMultiLogin;
    }

    public void setLimitMultiLogin(String limitMultiLogin) {
        this.limitMultiLogin = limitMultiLogin;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

}
