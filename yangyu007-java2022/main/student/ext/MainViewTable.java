package main.student.ext;


import javax.swing.*;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumn;
import java.awt.*;
import java.util.Vector;

public class MainViewTable extends JTable {
    public MainViewTable() {
        JTableHeader tableHeader = getTableHeader();

        //字体为默认，加粗，大小16
        tableHeader.setFont(new Font(null, Font.BOLD, 16));
        tableHeader.setForeground(Color.RED);

        //设置表格体
        setFont(new Font(null, Font.PLAIN, 14));
        setForeground(Color.black);

        //设置表格线颜色
        setGridColor(Color.BLACK);

        //设置表格体行高
        setRowHeight(30);
    }

    public void setDataModel(MainViewTableModel mainViewTableModel) {
        this.setModel(mainViewTableModel);
    }

    public void renderRule() {
        //设置表格渲染方式
        Vector<String> columns1 = MainViewTableModel.getColumns();
        MainViewCellRender render = new MainViewCellRender();
        for (int i = 0; i < columns1.size(); i++) {
            TableColumn column = getColumn(columns1.get(i));
            column.setCellRenderer(render);
            if (i == 0) {
                column.setPreferredWidth(50);
                column.setResizable(false);
            }
        }
    }
}
