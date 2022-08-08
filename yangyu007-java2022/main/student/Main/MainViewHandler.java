package main.student.Main;

import main.student.change.ChangeView;
import main.student.ext.AddView;
import main.student.ext.Excel;
import main.student.ext.del;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;

public class MainViewHandler extends JFrame implements ActionListener {
    private MainView mainView;

    public MainViewHandler(MainView mainView) {
        this.mainView=mainView;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        JButton jButton=(JButton) e.getSource();
        String text=jButton.getText();

        String searchTxt= mainView.getSearchTxt();
        if ("添加".equals(text)){
            new AddView();
            //增加所需的操作
            System.out.println("增加");
        }
        if ("修改".equals(text)){
            //增加所需的操作
            new ChangeView();
            System.out.println("修改");
        }
        if ("删除".equals(text)){
            try {
                boolean flag=del.de(searchTxt);
                if (flag==true){
                    JOptionPane.showMessageDialog(mainView,"删除成功！");
                }else {
                    JOptionPane.showMessageDialog(mainView,"删除失败，未查到此学号");
                }
                try {
                    new MainView();
                } catch (AWTException ex) {
                    throw new RuntimeException(ex);
                }
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
            System.out.println("删除");
        }
        if ("搜索".equals(text)){
            //增加所需的操作
        }
        if ("导出".equals(text)){
            //增加所需的操作
            try {
                Excel.main(new  String[1]);
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
            JOptionPane.showMessageDialog(mainView,"导出Excel成功！路径为D:\\student.xls");
        }
    }
}
