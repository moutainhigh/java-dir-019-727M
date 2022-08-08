package shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity;

import java.io.Serializable;
import java.util.Objects;

/**
 * 200720班同学基本信息(StudentInfo)实体类
 *
 * @author makejava
 * @since 2021-12-15 21:01:43
 */
public class StudentInfo implements Serializable {
    private static final long serialVersionUID = 882421973726300241L;

    private String studentId;

    private String chineseName;

    private String englishName;

    private String professional;

    private String grade;

    private String gender;

    private String classBatch;

    private String phoneNum;

    private String email;

    public StudentInfo() {
    }

    public StudentInfo(String studentId, String chineseName, String englishName, String professional, String grade, String gender, String classBatch, String phoneNum, String email) {
        this.studentId = studentId;
        this.chineseName = chineseName;
        this.englishName = englishName;
        this.professional = professional;
        this.grade = grade;
        this.gender = gender;
        this.classBatch = classBatch;
        this.phoneNum = phoneNum;
        this.email = email;
    }

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

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("StudentInfo{");
        sb.append("studentId='").append(studentId).append('\'');
        sb.append(", chineseName='").append(chineseName).append('\'');
        sb.append(", englishName='").append(englishName).append('\'');
        sb.append(", professional='").append(professional).append('\'');
        sb.append(", grade='").append(grade).append('\'');
        sb.append(", gender='").append(gender).append('\'');
        sb.append(", classBatch='").append(classBatch).append('\'');
        sb.append(", phoneNum='").append(phoneNum).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof StudentInfo)) return false;
        StudentInfo that = (StudentInfo) o;
        return Objects.equals(getStudentId(), that.getStudentId()) && Objects.equals(getChineseName(), that.getChineseName()) && Objects.equals(getEnglishName(), that.getEnglishName()) && Objects.equals(getProfessional(), that.getProfessional()) && Objects.equals(getGrade(), that.getGrade()) && Objects.equals(getGender(), that.getGender()) && Objects.equals(getClassBatch(), that.getClassBatch()) && Objects.equals(getPhoneNum(), that.getPhoneNum()) && Objects.equals(getEmail(), that.getEmail());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getStudentId(), getChineseName(), getEnglishName(), getProfessional(), getGrade(), getGender(), getClassBatch(), getPhoneNum(), getEmail());
    }
}
