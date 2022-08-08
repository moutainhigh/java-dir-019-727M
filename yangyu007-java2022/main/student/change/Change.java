package main.student.change;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
public class Change {
    public static void xiu(String nameTxt, String sidTxt, String gengdrTxt , String birthTxt,
                           String peTxt, String mathTxt, String javaTxt) throws IOException {
        String stu[]=new String[7];
        String xiug[]=new String[7];
//        陈浩,479139561374,男,2002-01-01,11,22,32
        xiug[0]=nameTxt;
        xiug[1]=sidTxt;
        xiug[2]=gengdrTxt;
        xiug[3]=birthTxt;
        xiug[4]= String.valueOf(mathTxt);
        xiug[5]= String.valueOf(javaTxt);
        xiug[6]= String.valueOf(peTxt);
        File file = new File("main/handler/txt/student.txt");
        FileInputStream input = new FileInputStream(file);
        BufferedReader reader = new BufferedReader(new InputStreamReader(input));
        String tempstring;
        List<String> list = new ArrayList<>();
        while ((tempstring = reader.readLine()) != null) {
            list.add(tempstring);//文件中的元素按行存放到集合中
        }
        tempstring="";
        for(String stud:list){
            stu=stud.split(",");
            if(xiug[1].equals(stu[1])){
                list.remove(stud);//删除符合要求的同学
                for(int i=0;i<xiug.length;i++)
                {   if(null == (xiug[i]))
                        tempstring+=stu[i];
                    else
                        tempstring+=xiug[i];
                    if (i!=xiug.length-1)
                        tempstring+=",";
                }
                list.add(tempstring);
                FileWriter fd=new FileWriter(file,false);
                fd.write("");//清空文件内容
                fd.close();
                break;
            }
        }
        FileWriter fd=new FileWriter(file,true);
        if(file.length()!=0){
            System.out.println("没有此学号");
            fd.close();
        }

        for(String stud1:list){
            stu=stud1.split(",");//集合中的元素以"，"为分隔符
            fd.write((stu[0])+","+(stu[1])+","+(stu[2])+","+(stu[3])+","+(stu[4])+","+(stu[5])+","+(stu[6])+"\n");
        }
        fd.close();
}
}
