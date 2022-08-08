package shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity;

import java.util.Objects;

/**
 * 员工实体类
 *
 * @author yaojianfeng
 */
public class Employ {
    private int empno;
    private String ename;
    private String job;
    private int sal;

    public Employ() {
    }

    public Employ(int empno, String ename, String job, int sal) {
        this.empno = empno;
        this.ename = ename;
        this.job = job;
        this.sal = sal;
    }



    public int getEmpno() {
        return empno;
    }

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getSal() {
        return sal;
    }

    public void setSal(int sal) {
        this.sal = sal;
    }
    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Employ{");
        sb.append("empno=").append(empno);
        sb.append(", ename='").append(ename).append('\'');
        sb.append(", job='").append(job).append('\'');
        sb.append(", sal=").append(sal);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Employ)) return false;
        Employ employ = (Employ) o;
        return getEmpno() == employ.getEmpno() && getSal() == employ.getSal() && getEname().equals(employ.getEname()) && getJob().equals(employ.getJob());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getEmpno(), getEname(), getJob(), getSal());
    }
}
