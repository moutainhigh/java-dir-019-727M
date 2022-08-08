package main.student.ext;


import javax.swing.table.DefaultTableModel;
import java.util.Vector;

public class MainViewTableModel extends DefaultTableModel {

    //定义列 标头
    static Vector<String> columns = new Vector<>();
    private static MainViewTableModel mainViewTableModel = new MainViewTableModel();

    static {
        columns.addElement("姓名");
        columns.addElement("学号");
        columns.addElement("性别");
        columns.addElement("出生年月");
        columns.addElement("数学");
        columns.addElement("Java");
        columns.addElement("体育");
//        columns.addElement("总分");
    }

    private MainViewTableModel() {
        super(null, columns);
    }

    public static MainViewTableModel assemTableModel(Vector<Vector<Object>> data) {
        mainViewTableModel.setDataVector(data, columns);
        return mainViewTableModel;
    }

    //获取列名
    public static Vector<String> getColumns() {
        return columns;
    }

    //设置表格内容是否能够编辑
    @Override
    public boolean isCellEditable(int row, int column) {
        return false;
    }

}
