package shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity;

import java.io.Serializable;

/**
 * 200720班同学基本信息(StudentMarkInfo)实体类
 *
 * @author 
 * @since 2022-01-04 16:51:30
 */
public class StudentMarkInfo implements Serializable {
    private static final long serialVersionUID = 194679897387915119L;
    
    private String studentId;
    
    private String chineseName;
    
    private String englishName;
    
    private String professional;
    
    private String grade;
    
    private String gender;
    
    private String classBatch;
    
    private String phoneNum;
    
    private String email;
    /**
     * 第一次月考成绩
     */
    private Integer monthTest;
    /**
     * html期中考试成绩
     */
    private Integer htmlMidTest;
    /**
     * JSPServlet期中考试成绩
     */
    private Integer jspservletMidTest;
    /**
     * html期末考试成绩
     */
    private Integer htmlEndTest;
    /**
     * jspservlet期末考试成绩
     */
    private Integer jspservletEndTest;
    /**
     * html5 平时成绩
     */
    private Integer html5NormalMark;
    /**
     * JSPServlet平时成绩
     */
    private Integer jspservletNormalMark;


    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getClassBatch() {
        return classBatch;
    }

    public void setClassBatch(String classBatch) {
        this.classBatch = classBatch;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getMonthTest() {
        return monthTest;
    }

    public void setMonthTest(Integer monthTest) {
        this.monthTest = monthTest;
    }

    public Integer getHtmlMidTest() {
        return htmlMidTest;
    }

    public void setHtmlMidTest(Integer htmlMidTest) {
        this.htmlMidTest = htmlMidTest;
    }

    public Integer getJspservletMidTest() {
        return jspservletMidTest;
    }

    public void setJspservletMidTest(Integer jspservletMidTest) {
        this.jspservletMidTest = jspservletMidTest;
    }

    public Integer getHtmlEndTest() {
        return htmlEndTest;
    }

    public void setHtmlEndTest(Integer htmlEndTest) {
        this.htmlEndTest = htmlEndTest;
    }

    public Integer getJspservletEndTest() {
        return jspservletEndTest;
    }

    public void setJspservletEndTest(Integer jspservletEndTest) {
        this.jspservletEndTest = jspservletEndTest;
    }

    public Integer getHtml5NormalMark() {
        return html5NormalMark;
    }

    public void setHtml5NormalMark(Integer html5NormalMark) {
        this.html5NormalMark = html5NormalMark;
    }

    public Integer getJspservletNormalMark() {
        return jspservletNormalMark;
    }

    public void setJspservletNormalMark(Integer jspservletNormalMark) {
        this.jspservletNormalMark = jspservletNormalMark;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("StudentMarkInfo{");
        sb.append("studentId='").append(studentId).append('\'');
        sb.append(", chineseName='").append(chineseName).append('\'');
        sb.append(", englishName='").append(englishName).append('\'');
        sb.append(", professional='").append(professional).append('\'');
        sb.append(", grade='").append(grade).append('\'');
        sb.append(", gender='").append(gender).append('\'');
        sb.append(", classBatch='").append(classBatch).append('\'');
        sb.append(", phoneNum='").append(phoneNum).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", monthTest=").append(monthTest);
        sb.append(", htmlMidTest=").append(htmlMidTest);
        sb.append(", jspservletMidTest=").append(jspservletMidTest);
        sb.append(", htmlEndTest=").append(htmlEndTest);
        sb.append(", jspservletEndTest=").append(jspservletEndTest);
        sb.append(", html5NormalMark=").append(html5NormalMark);
        sb.append(", jspservletNormalMark=").append(jspservletNormalMark);
        sb.append('}');
        return sb.toString();
    }
}

