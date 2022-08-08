package main.student.Login;


import main.student.Main.MainView;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class LoginHandler extends KeyAdapter implements ActionListener {
    private LoginView loginView;
    public LoginHandler(LoginView loginView){
        this.loginView = loginView;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        JButton jButton=(JButton) e.getSource();
        String text=jButton.getText();
        if("登录".equals(text)){
            login();
        } else if ("清空".equals(text)) {
            loginView.getUserNameText().setText("");
            loginView.getPwdfield().setText("");
        }
    }

    //登录方法
    private void login() {
        String user=loginView.getUserNameText().getText();
        char[] chars = loginView.getPwdfield().getPassword();
        if (user==null ||"".equals(user.trim())||chars==null){
            JOptionPane.showMessageDialog(loginView,"用户名密码请不要为空！");
            return;
        }
        String pwd=new String(chars);
//        System.out.println(user+":"+pwd);

        boolean flag=false;
        if (user.equals("admin")&&pwd.equals("123")){
            flag=true;
        }

        if (flag){
            //登录成功消息弹窗
            JOptionPane.showMessageDialog(loginView,"登录成功！");
            //跳转到主界面并销毁登录界面
            try {
                new MainView();
            } catch (AWTException e) {
                throw new RuntimeException(e);
            }
            //销毁loginView界面
            loginView.dispose();
        } else {
            //登录失败消息弹窗
            JOptionPane.showMessageDialog(loginView,"用户名密码错误！");
        }
    }

    //回车键登录
    @Override
    public void keyPressed(KeyEvent e) {
        if(KeyEvent.VK_ENTER==e.getKeyCode()){
            login();
        }
    }
}
