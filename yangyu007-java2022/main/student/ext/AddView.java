package main.student.ext;

import main.student.Main.MainView;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;


public class AddView extends JFrame implements ActionListener{

    JLabel nameLab=new JLabel("姓名:");
    JLabel genderLab=new JLabel("性别:");
    JLabel birthLab=new JLabel("出生年月:");
    JLabel mathLab=new JLabel("数学:");
    JLabel javaLab=new JLabel("Java:");
    JLabel peLab=new JLabel("体育:");
    JTextField nameTxt=new JTextField(15);

    JTextField birthTxt=new JTextField(15);
    JTextField mathTxt=new JTextField(15);
    JTextField javaTxt=new JTextField(15);
    JTextField peTxt=new JTextField(15);
    JButton saveBtn =new JButton("保存");
    JButton resetBtn =new JButton("清空");

    JCheckBox c_box_1=new JCheckBox("男",true);
    JCheckBox c_box_2=new JCheckBox("女");

    ButtonGroup group_1=new ButtonGroup();


    public AddView(){
        super("填写学生信息");

        //弹簧布局
        SpringLayout layout = new SpringLayout();
        JPanel centerPanel = new JPanel(layout);

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

        group_1.add(c_box_1);
        group_1.add(c_box_2);

        saveBtn.addActionListener(this);
        resetBtn.addActionListener(this);



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


        // 布局位置
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
        SpringLayout.Constraints c_box_21= layout.getConstraints(c_box_2);
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


        //图标
//        URL imgUrl = LoginView.class.getClassLoader().getResource("main/resources/学校_学生.png");
//        setIconImage(new ImageIcon(imgUrl).getImage());
        //窗口可见
        setVisible(true);
        //设置全屏大小
        setSize(400,600);
        //设置居中
        setLocationRelativeTo(null);
        //设置不可调整大小
        setResizable(false);
    }

    public static void main(String[] args) {
        new AddView();
    }
    private AddView addView;
    @Override
    public void actionPerformed(ActionEvent e) {
        //日期正则表达式
        String birthM="([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))";
        //清空按钮
        if (e.getSource()== resetBtn){
            nameTxt.setText("");
            birthTxt.setText("");
            mathTxt.setText("");
            javaTxt.setText("");
            peTxt.setText("");
        }
        //保存按钮
        if (e.getSource()==saveBtn){
            //nameTxtText用户输入的名字
            String nameTxtText = nameTxt.getText();
            //birthTxtText用户输入的出生日期
            String birthTxtText = birthTxt.getText();
            //mathTxtText用户输入的数学成绩
            String mathTxtText = mathTxt.getText();
            //javaTxtText用户输入的Java成绩
            String javaTxtText = javaTxt.getText();
            //peTxtText用户输入的体育成绩
            String peTxtText = peTxt.getText();

            //c_box_1Selected用户选择的性别
            // 若c_box_1Selected=true则为男生
            // 若c_box_1Selected=false则为女生
            boolean c_box_1Selected = c_box_1.isSelected();
            //保存按钮
            try (BufferedWriter wr = new BufferedWriter(new FileWriter("main/handler/txt/student.txt",true))) {
                String bo;
                if (c_box_1Selected)
                    bo = "男";
                else bo = "女";
                try {
                    if ("".equals(nameTxtText)||"".equals(birthTxtText)||
                            "".equals(mathTxtText)||"".equals(javaTxtText)||
                            "".equals(peTxtText))
                    {
                        JOptionPane.showMessageDialog(addView,"请不要留空！");
                        return;
                    }
                    if (birthTxtText.matches(birthM)==false) {
                        JOptionPane.showMessageDialog(addView,"请输入正确的日期！格式为：yyyy-MM-dd");
                        return;
                    }
                    //生成学号
                    String[] str = {};
                    String f = null;
                    do {
                        String[] num = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
                        Random r = new Random();
                        String m = num[r.nextInt(9) + 1];
                        for (int i = 0; i < 11; i++)
                        {
                            m+=num[r.nextInt(10)];
                        }
                        int i;
                        for (i = 0; i < str.length; i++) {
                            if(m == str[i])
                                break;
                        }
                        if(i==str.length)
                            f=m;
                    }while (f==null);
                    //写入到文件末尾
                    wr.write(nameTxtText + "," +f+","+bo + "," + birthTxtText + "," + mathTxtText + "," + javaTxtText + "," + peTxtText);
                    wr.newLine();
                    wr.flush();
                    wr.close();
                    JOptionPane.showMessageDialog(addView,"添加成功！如不需再添加请关闭此窗口");
                    try {
                        new MainView();
                    } catch (AWTException ex) {
                        throw new RuntimeException(ex);
                    }
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
