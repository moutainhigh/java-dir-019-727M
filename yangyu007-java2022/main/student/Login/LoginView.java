package main.student.Login;

import javax.swing.*;
import java.awt.*;

public class LoginView extends JFrame {
    //弹簧布局
    SpringLayout springLayout=new SpringLayout();
    JPanel centerPanel=new JPanel(springLayout);
    JLabel nameLabel=new JLabel("学生成绩管理系统",JLabel.CENTER);
    JLabel userNameLabel=new JLabel("用户名:");
    JTextField userNameText=new JTextField(15);
    JLabel pwdLabel =new JLabel("密码:");
    JPasswordField pwdfield =new JPasswordField(15);
    JButton loginBtn=new JButton("登录");
    JButton resetBtn=new JButton("清空");
    LoginHandler loginHandler;
    public LoginView() throws AWTException {
        super("学生成绩管理系统");
        Container contentPane=getContentPane();
        loginHandler=new LoginHandler(this);
        nameLabel.setFont(new Font("华文隶书",Font.PLAIN,40));
        nameLabel.setPreferredSize(new Dimension(0,80));
        Font centerFont = new Font("楷体", Font.PLAIN, 20);
        userNameLabel.setFont(centerFont);
        pwdLabel.setFont(centerFont);
        userNameText.setPreferredSize(new Dimension(200,30));
        pwdfield.setPreferredSize(new Dimension(200,30));
        loginBtn.setFont(centerFont);
        resetBtn.setFont(centerFont);

        //把组件加入面板
        centerPanel.add(userNameLabel);
        centerPanel.add(userNameText);
        centerPanel.add(pwdLabel);
        centerPanel.add(pwdfield);
        centerPanel.add(loginBtn);        loginBtn.addActionListener(loginHandler);
        //设置默认按钮
        loginBtn.addKeyListener(loginHandler);
        centerPanel.add(resetBtn);
        resetBtn.addActionListener(loginHandler);


        //弹簧布局
        //布局userNameLabel
         SpringLayout.Constraints usernamelabelc= springLayout.getConstraints(userNameLabel);
         usernamelabelc.setX(Spring.constant(180));
         usernamelabelc.setY(Spring.constant(20));
        //usertext
        springLayout.putConstraint(springLayout.WEST,userNameText,10,springLayout.EAST,userNameLabel);
        springLayout.putConstraint(springLayout.NORTH,userNameText,0,springLayout.NORTH,userNameLabel);
        //pwdlabel
        springLayout.putConstraint(springLayout.EAST,pwdLabel,0,springLayout.EAST,userNameLabel);
        springLayout.putConstraint(springLayout.NORTH,pwdLabel,20,springLayout.SOUTH,userNameLabel);
        //pwdfield
        springLayout.putConstraint(springLayout.WEST, pwdfield,10,springLayout.EAST,pwdLabel);
        springLayout.putConstraint(springLayout.NORTH, pwdfield,0,springLayout.NORTH,pwdLabel);
        //loginBtn
        springLayout.putConstraint(springLayout.EAST,loginBtn,0,springLayout.EAST,pwdLabel);
        springLayout.putConstraint(springLayout.NORTH,loginBtn,30,springLayout.SOUTH,pwdLabel);
        //resetBtn
        springLayout.putConstraint(springLayout.WEST,resetBtn,90,springLayout.EAST,loginBtn);
        springLayout.putConstraint(springLayout.NORTH,resetBtn,0,springLayout.NORTH,loginBtn);
        //添加到面板
        contentPane.add(nameLabel,BorderLayout.NORTH);
        contentPane.add(centerPanel,BorderLayout.CENTER);
        //设置默认按钮
        getRootPane().setDefaultButton(loginBtn);
        //自定义图标
//        URL imgUrl = LoginView.class.getClassLoader().getResource("main/resources/学校_学生.png");
//        setIconImage(new ImageIcon(imgUrl).getImage());
        //窗口可见
        setVisible(true);
        //设置大小
        setSize(600,400);
        //设置居中
        setLocationRelativeTo(null);
        //设置不可调整大小
        setResizable(false);
        //设置关闭退出程序
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }



    public static void main(String[] args) {
        try {
            new LoginView();
        } catch (AWTException e) {
            throw new RuntimeException(e);
        }
    }

    public JTextField getUserNameText() {
        return userNameText;
    }
    public JPasswordField getPwdfield() {
        return pwdfield;
    }
}

