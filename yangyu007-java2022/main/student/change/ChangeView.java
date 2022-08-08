package main.student.change;

import main.student.Main.MainView;
import main.student.search.SearchSid;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;

public class ChangeView extends JFrame implements ActionListener {


    JButton searchBtn =new JButton("搜索");
    JLabel sidLab=new JLabel("学号:");
    JTextField sidTxt=new JTextField(15);
    JLabel nameLab = new JLabel("姓名:");
    JLabel genderLab = new JLabel("性别:");
    JLabel birthLab = new JLabel("出生年月:");
    JLabel mathLab = new JLabel("数学:");
    JLabel javaLab = new JLabel("Java:");
    JLabel peLab = new JLabel("体育:");
    JTextField nameTxt = new JTextField(15);

    JTextField birthTxt = new JTextField(15);
    JTextField mathTxt = new JTextField(15);
    JTextField javaTxt = new JTextField(15);
    JTextField peTxt = new JTextField(15);
    JButton saveBtn = new JButton("保存");
    JButton resetBtn = new JButton("清空");

    JCheckBox c_box_1 = new JCheckBox("男", true);
    JCheckBox c_box_2 = new JCheckBox("女");

    ButtonGroup group_1 = new ButtonGroup();
    private MainView mainView;
    private ChangeView changeView;

    public ChangeView() {
        super("修改学生信息");

        //弹簧布局
        SpringLayout layout = new SpringLayout();
        JPanel centerPanel = new JPanel(layout);

        centerPanel.add(sidLab);
        centerPanel.add(sidTxt);
        centerPanel.add(searchBtn);
        centerPanel.add(nameLab);
        centerPanel.add(nameTxt);
        centerPanel.add(genderLab);
        centerPanel.add(birthLab);
        centerPanel.add(birthTxt);
        centerPanel.add(saveBtn);
        centerPanel.add(resetBtn);
        centerPanel.add(mathLab);
        centerPanel.add(mathTxt);
        centerPanel.add(javaLab);
        centerPanel.add(javaTxt);
        centerPanel.add(peLab);
        centerPanel.add(peTxt);
        centerPanel.add(c_box_1);
        centerPanel.add(c_box_2);
        searchBtn.addActionListener(this);
        saveBtn.addActionListener(this);
        resetBtn.addActionListener(this);

        group_1.add(c_box_1);
        group_1.add(c_box_2);

        //设置字体
        Font centerFont = new Font("楷体", Font.PLAIN, 20);
        nameLab.setFont(centerFont);
        genderLab.setFont(centerFont);
        birthLab.setFont(centerFont);
        saveBtn.setFont(centerFont);
        resetBtn.setFont(centerFont);
        mathLab.setFont(centerFont);
        javaLab.setFont(centerFont);
        peLab.setFont(centerFont);
        sidLab.setFont(centerFont);

        // sidLab
        SpringLayout.Constraints sidLab1 = layout.getConstraints(sidLab);
        sidLab1.setX(Spring.constant(100));
        sidLab1.setY(Spring.constant(50));
        //sidTxt
        SpringLayout.Constraints sidTxt1 = layout.getConstraints(sidTxt);
        sidTxt1.setX(Spring.constant(150));
        sidTxt1.setY(Spring.constant(50));
        //searchBtn
        SpringLayout.Constraints searchBtn1 = layout.getConstraints(searchBtn);
        searchBtn1.setX(Spring.constant(310));
        searchBtn1.setY(Spring.constant(50));

        // nameLab
        SpringLayout.Constraints labelCons = layout.getConstraints(nameLab);
        labelCons.setX(Spring.constant(100));
        labelCons.setY(Spring.constant(100));
        //nameTxt
        SpringLayout.Constraints nameTxt1 = layout.getConstraints(nameTxt);
        nameTxt1.setX(Spring.constant(150));
        nameTxt1.setY(Spring.constant(100));
        //genderLab
        SpringLayout.Constraints genderLab1 = layout.getConstraints(genderLab);
        genderLab1.setX(Spring.constant(100));
        genderLab1.setY(Spring.constant(150));
        //c_box_1
        SpringLayout.Constraints c_box_11 = layout.getConstraints(c_box_1);
        c_box_11.setX(Spring.constant(150));
        c_box_11.setY(Spring.constant(150));
        //c_box_1
        SpringLayout.Constraints c_box_21 = layout.getConstraints(c_box_2);
        c_box_21.setX(Spring.constant(200));
        c_box_21.setY(Spring.constant(150));
        //birthLab
        SpringLayout.Constraints birthLab1 = layout.getConstraints(birthLab);
        birthLab1.setX(Spring.constant(60));
        birthLab1.setY(Spring.constant(200));
        //birthTxt
        SpringLayout.Constraints birthTxt1 = layout.getConstraints(birthTxt);
        birthTxt1.setX(Spring.constant(150));
        birthTxt1.setY(Spring.constant(200));
        //mathLab
        SpringLayout.Constraints mathLab1 = layout.getConstraints(mathLab);
        mathLab1.setX(Spring.constant(100));
        mathLab1.setY(Spring.constant(250));
        //mathTxt
        SpringLayout.Constraints mathTxt1 = layout.getConstraints(mathTxt);
        mathTxt1.setX(Spring.constant(150));
        mathTxt1.setY(Spring.constant(250));
        //javaLab
        SpringLayout.Constraints javaLab1 = layout.getConstraints(javaLab);
        javaLab1.setX(Spring.constant(100));
        javaLab1.setY(Spring.constant(300));
        //javaTxt
        SpringLayout.Constraints javaTxt1 = layout.getConstraints(javaTxt);
        javaTxt1.setX(Spring.constant(150));
        javaTxt1.setY(Spring.constant(300));
        //peLab
        SpringLayout.Constraints peLab1 = layout.getConstraints(peLab);
        peLab1.setX(Spring.constant(100));
        peLab1.setY(Spring.constant(350));
        //peTxt
        SpringLayout.Constraints peTxt1 = layout.getConstraints(peTxt);
        peTxt1.setX(Spring.constant(150));
        peTxt1.setY(Spring.constant(350));
        //addBtn
        SpringLayout.Constraints addBtn1 = layout.getConstraints(saveBtn);
        addBtn1.setX(Spring.constant(150));
        addBtn1.setY(Spring.constant(400));
        //resetBtn
        SpringLayout.Constraints resetBtn1 = layout.getConstraints(resetBtn);
        resetBtn1.setX(Spring.constant(250));
        resetBtn1.setY(Spring.constant(400));


        Container contentPane = getContentPane();
        contentPane.add(centerPanel);

        //窗口可见
        setVisible(true);
        //设置全屏大小
        setSize(400, 600);
        //设置居中
        setLocationRelativeTo(null);
        //设置不可调整大小
        setResizable(false);
    }

    public static void main(String[] args) {
        new ChangeView();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        String sidTxtText = sidTxt.getText();
        if (e.getSource()==searchBtn){
            if ("".equals(sidTxtText)){
                JOptionPane.showMessageDialog(changeView,"学号请不要为空！");
                return;
            }
            try {
                int flag = SearchSid.sou(sidTxtText);
                if (flag==0){
                    JOptionPane.showMessageDialog(changeView,"查无此人！");
                    return;
                }
                if(flag==1){
                    nameTxt.setText(SearchSid.name);
                    birthTxt.setText(SearchSid.birth);
                    javaTxt.setText(String.valueOf(SearchSid.java));
                    peTxt.setText(String.valueOf(SearchSid.pe));
                    mathTxt.setText(String.valueOf(SearchSid.math));
                    JOptionPane.showMessageDialog(changeView,"查到了！");
                }
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }
        if (e.getSource()==resetBtn){
            sidTxt.setText("");
            nameTxt.setText("");
            birthTxt.setText("");
            javaTxt.setText("");
            peTxt.setText("");
            mathTxt.setText("");
            JOptionPane.showMessageDialog(changeView,"已经清空");
        }
        if (e.getSource()==saveBtn){
            try {
                //陈浩,479139561374,男,2002-01-01,11,22,32
                boolean c_box_1Selected = c_box_1.isSelected();
                String bo;
                if (c_box_1Selected)
                    bo = "男";
                else bo = "女";
                Change.xiu(nameTxt.getText(),sidTxt.getText(),bo,birthTxt.getText()
                ,peTxt.getText(),mathTxt.getText(),peTxt.getText());
                JOptionPane.showMessageDialog(changeView,"修改成功！");
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }
    }
}
