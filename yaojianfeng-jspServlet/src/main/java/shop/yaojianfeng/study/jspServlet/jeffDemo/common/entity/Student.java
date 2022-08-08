package shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity;

/**
 * 学生实体类
 * @author yaojianfeng
 */
public class Student  {
    private String name;
    private int id;


    public Student(String name, int id) {
        this.name = name;
        this.id = id;
    }

    public Student() {
    }

    public String getName() {
        return name;
    }

    /**
     * 对外提供一个共有属性: grade
     * @return
     */
    public String getGrade() {

        return "2020";
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Student{");
        sb.append("name='").append(name).append('\'');
        sb.append(", id=").append(id);
        sb.append('}');
        return sb.toString();
    }
}
