package shop.yaojianfeng.study.jspServlet.jeffDemo.section7;

import shop.yaojianfeng.study.jspServlet.jeffDemo.common.entity.Employ;
import shop.yaojianfeng.study.jspServlet.jeffDemo.common.utils.MyStringUtil;

import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 原始JDBC 操作步骤演示文档
 *
 * @author yaojianfeng
 */
public class JdbcDemo {
    public static void main(String[] args) {
        JdbcDemo jdbcDemo = new JdbcDemo();
        //1. 注册驱动并测试是否可以连接数据库
        Connection connection = jdbcDemo.connectTest();
        //2.获取数据库操作对象
        Statement statement = jdbcDemo.getStatement(connection);
//        Employ employ = new Employ(9999, "王五", "前端开发工程师", 15000);
        //3.执行语句
//        int insertNum = jdbcDemo.insertOneEmploy(employ, statement);
//        int deleteNum = jdbcDemo.deleteOneEmploy(employ, statement);
//        int updateNum = jdbcDemo.updateOneEmploy(employ, statement);
       /* ResultSet resultSet = jdbcDemo.queryEmpInfo(statement);
        //4. 处理结果集
//        System.out.println(insertNum > 0 ? "插入成功" : "插入失败");
//        System.out.println(deleteNum>0?"删除成功":"删除失败");
//        System.out.println(updateNum>0?"更新成功":"更新失败");
        ArrayList<Employ> employs = new ArrayList<>();
        try {
            while (resultSet.next()) {
                Employ employ = new Employ();
                employ.setEname(resultSet.getString("ename"));
                employ.setSal(resultSet.getInt("sal"));
                System.out.println(employ.toString());
                employs.add(employ);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(employs);


        //5.释放资源
        jdbcDemo.close(connection, statement, null);*/

    }

    /**
     * 测试是否可以连接数据库
     */
    private Connection connectTest() {
        Connection connection = null;
        try {
            //1. 注册驱动 mysql
            Class.forName("com.mysql.cj.jdbc.Driver");
            //2. 获取连接对象
            try {
                //8.0之后的版本需要加上serverTimezone参数
                connection = DriverManager
                        .getConnection("jdbc:mysql://localhost:3306/test?serverTimezone=GMT%2B8&characterEncoding=utf-8"
                                , "root", "yaojianfeng");
                DatabaseMetaData metaData = connection.getMetaData();
                String userName = metaData.getUserName();
                System.out.println("当前登录人是:" + userName);
                return connection;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * 获取数据库操作执行对象
     *
     * @param connection
     * @return
     */
    private Statement getStatement(Connection connection) {
        Statement statement = null;
        try {
            statement = connection.createStatement();
            System.out.println(statement.getConnection().getMetaData().getUserName() + "已经成功获取数据库操作对象");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statement;
    }


    /**
     * 增加一条员工信息
     *
     * @param employ
     * @return
     */
    private int insertOneEmploy(Employ employ, Statement statement) {
        //构建sql
        String sql = "insert into emp(empno, ename, job, sal) values";
        sql = sql + "(" + employ.getEmpno() + ",'" + employ.getEname() + "','" + employ.getJob() + "'," + employ.getSal() + ")";


        //执行语句
        int result = 0;
        try {
            result = statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    /**
     * 删除一条员工记录
     *
     * @param employ
     * @param statement
     * @return
     */
    private int deleteOneEmploy(Employ employ, Statement statement) {
        //构建sql
        String sql = "DELETE FROM emp where empno =" + employ.getEmpno();
        //执行语句
        int result = 0;
        try {
            result = statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 更新一条员工记录
     *
     * @param employ
     * @param statement
     * @return
     */
    private int updateOneEmploy(Employ employ, Statement statement) {
        //构建sql
        String sql = "UPDATE emp SET ename='" + employ.getEname() + "' WHERE empno =" + employ.getEmpno();
        //执行语句
        int result = 0;
        try {
            result = statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 从数据库中查询记录
     *
     * @param statement
     * @return
     */
    private ResultSet queryEmpInfo(Statement statement) {
        //构建sql
        String sql = "SELECT * FROM emp";
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }


    /**
     * 关闭资源 遵循从小到大依次关闭
     * 该方法要在finally语句块中调用
     */
    public void close(Connection connection, Statement stmt, ResultSet resultSet) {


        try {
            if (resultSet != null && !resultSet.isClosed()) {
                resultSet.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (stmt != null && !stmt.isClosed()) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("释放资源成功!");
    }

    /**
     * 过滤非当前班级人员
     * @param connection
     * @param classBatch
     * @param nameList
     * @return
     * @throws SQLException
     */
    private ArrayList<String> filterName(Connection connection,String classBatch,String nameList) throws SQLException {
        //获取班级所有人的名字集合
        Statement statement = connection.createStatement();
        String sql="select chinese_name from student_info_20 where class_batch = '"+classBatch+"'";
        ResultSet resultSet = statement.executeQuery(sql);
        ArrayList<String> dataNameList = new ArrayList<>();
        while (resultSet.next()){
            dataNameList.add(resultSet.getString("chinese_name"));
        }
        String[] split  = nameList.replaceAll("\\s*|\t|\r|\n", "").split(",");

        List<String> ownNameList = Arrays.asList(split);
        ArrayList<String> collect = (ArrayList<String>) ownNameList.stream().filter(name->!dataNameList.contains(name)).collect(Collectors.toList());
        return collect;
    }

    /**
     * 打印重名信息
     * @param nameList
     */
    private void printName(String nameList){
        String s = MyStringUtil.makeTogether(nameList);
        //获取 名称集合
        List<String> strings = Arrays.asList(s.split(","));
        for (String string : strings) {
            int i = MyStringUtil.countStr(strings, string);
            if (i>1){
                System.out.println(string);
            }
        }
    }

    private void updateMark(String infoString,Statement statement) throws SQLException {
        //1.将字符串按照";"分割为数组
        String[] split  = infoString.replaceAll("\\s*|\t|\r|\n", "").split(";");

        //2.将数组内元素按照","分割为键值对存储在map中,
        HashMap<String, Integer> map = new HashMap<>();
        for (String s : split) {
            String[] temp  = s.replaceAll("\\s*|\t|\r|\n", "").split(",");
            map.put(temp[0],Integer.parseInt(temp[1]));
        }
//        Set<String> strings = map.keySet();

        //3.对map进行遍历 并更新数据库中的值
        Set<Map.Entry<String, Integer>> entries = map.entrySet();
        for (Map.Entry<String, Integer> entry : entries) {
           //构建sql
            String sql  = "update student_info_20 set jspservlet_normal_mark = '"+entry.getValue()+"' WHERE chinese_name = '"+entry.getKey()+"'";
            //执行sql
            statement.executeUpdate(sql);
        }


    }

}
