package main.handler.Frame;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MyFrame extends JFrame implements ActionListener {
    private JLabel lb1;
    private JLabel lb2;
    private JTextField text1;
    private JTextField text2;
    private JButton btn1;
    private JButton btn2;
    private JButton btn3;
    public MyFrame(){
        lb1=new JLabel("学号:");
        lb2=new JLabel("姓名:");
        text1=new JTextField(12);
        text2=new JTextField(12);
        btn1=new JButton("登录");
        btn2=new JButton("注册");
        btn3=new JButton("忘记密码？");
        //动作监听器
        btn1.addActionListener(this);
        btn2.addActionListener(this);
        //设置icon图像
//        MyFrame.class.getDeclaredClasses().getResource("学生.png");
//        Image image= new ImageIcon().getImage();
//        setIconImage(image);
        //自身窗体 可见
        setVisible(true);
        //居中
        setLocationRelativeTo(null);
        //设置大小
        setSize(600,400);
        //不可改变大小
        setResizable(true);
        //关闭程序
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //弹簧布局
        this.setLayout(new SpringLayout());

        this.add(lb1);
        this.add(text1);
        this.add(lb2);
        this.add(text2);
        this.add(btn1);
        this.add(btn2);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btn1){
            text1.setText("点击了确定");
        }
        if (e.getSource() == btn2){
            text1.setText("");
            text2.setText("");
        }
    }
}
