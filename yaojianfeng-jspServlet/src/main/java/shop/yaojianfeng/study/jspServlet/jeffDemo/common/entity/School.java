package shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity;

import java.io.Serializable;

/**
 *  学校类
 * @author yaojianfeng
 */
public class School  {
    private String address;
    private String schoolName;

    public School() {
    }

    public School(String address, String schoolName) {
        this.address = address;
        this.schoolName = schoolName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("School{");
        sb.append("address='").append(address).append('\'');
        sb.append(", schoolName='").append(schoolName).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
