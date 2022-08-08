package main.student.Main;

import main.handler.txt.Student;
import main.student.ext.MainViewTable;
import main.student.ext.MainViewTableModel;
import main.util.DimensionUtil;

import javax.swing.*;
import java.awt.*;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

public class MainView extends JFrame{
    JPanel northPanel=new JPanel(new FlowLayout(FlowLayout.LEFT));
    JButton addBtn=new JButton("添加");
    JButton updateBtn=new JButton("修改");
    JButton delBtn=new JButton("删除");
    JTextField searchTxt =new JTextField(15);
    JButton searchBtn = new JButton("搜索");
    JButton exportBtn = new JButton("导出");


    MainViewTable mainViewTable=new MainViewTable();
    MainViewHandler mainViewHandler;
    public MainView() throws AWTException{
        super("学生成绩管理系统");
        Container contentPane = getContentPane();

        mainViewHandler=new MainViewHandler(this);
        //北边的组件
        layoutNorth(contentPane);
        //中间的组件
        layoutCentre(contentPane);



//        //自定义图标
//        URL imgUrl = LoginView.class.getClassLoader().getResource("main/resources/学校_学生.png");
//        setIconImage(new ImageIcon(imgUrl).getImage());
        //窗口可见
        setVisible(true);
        //设置全屏大小
        setBounds(DimensionUtil.getBounds());
        //设置窗体完全充满屏幕大小
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        //设置居中
        setLocationRelativeTo(null);
        //设置不可调整大小
        setResizable(true);
        //设置关闭退出程序
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    private void layoutCentre(Container contentPane) {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("main/handler/txt/student.txt"));
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        ArrayList<Student> array = new ArrayList<Student>();
        String line = null;
        try {
            line = br.readLine();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        while (line != null) {
            //不读其中的”,“
            String[] strings = line.split(",");
            Student student=new Student();
            student.setName(strings[0]);
            student.setSid(strings[1]);
            student.setGender(strings[2]);
            student.setBirth(strings[3]);
            student.setMath(Integer.parseInt(strings[4]));
            student.setJava(Integer.parseInt(strings[5]));
            student.setPe(Integer.parseInt(strings[6]));
            array.add(student);
            try {
                line= br.readLine();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        try {
            br.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        Vector<Vector<Object>> data =new Vector<>();
        for (Student student:array) {
            Vector<Object> OneVector=new Vector<>();
            OneVector.addElement(student.getName());
            OneVector.addElement(student.getSid());
            OneVector.addElement(student.getGender());
            OneVector.addElement(student.getBirth());
            OneVector.addElement(student.getJava());
            OneVector.addElement(student.getMath());
            OneVector.addElement(student.getPe());
            data.addElement(OneVector);
        }
        MainViewTableModel mainViewTableModel = MainViewTableModel.assemTableModel(data);
        mainViewTable.setDataModel(mainViewTableModel);
        mainViewTable.renderRule();
        JScrollPane jScrollPane=new JScrollPane(mainViewTable);
        contentPane.add(jScrollPane);
    }
    private void layoutNorth(Container contentPane) {

        northPanel.add(addBtn);
        addBtn.addActionListener(mainViewHandler);
        northPanel.add(updateBtn);
        updateBtn.addActionListener(mainViewHandler);
        northPanel.add(delBtn);
        delBtn.addActionListener(mainViewHandler);
        northPanel.add(searchTxt);
        northPanel.add(searchBtn);
        searchBtn.addActionListener(mainViewHandler);
        northPanel.add(exportBtn);
        exportBtn.addActionListener(mainViewHandler);
        contentPane.add(northPanel,BorderLayout.NORTH);
    }

    public static void main(String[] args) {
        try {
            new MainView();
        } catch (AWTException e) {
            throw new RuntimeException(e);
        }
    }
    public String getSearchTxt() {
        String searchTxtText = searchTxt.getText();
        return searchTxtText;
    }
}
