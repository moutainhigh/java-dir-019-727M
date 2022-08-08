package main.student.search;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
public class SearchSid
   {
       public static String name;
       public static String sid;
       public static String gender;
       public static String birth;
       public static int math;
       public static int java;
       public static int pe;
        public static int sou(String searchTxt) throws IOException {
            String stu[]=new String[7];
            //保存学号，从搜索框里取值；
            String xiug =searchTxt;
            File file = new File("main/handler/txt/student.txt");
            FileInputStream input = new FileInputStream(file);
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            String tempString;
            List<String> list = new ArrayList<>();
            while ((tempString = reader.readLine()) != null) {
                list.add(tempString);//文件中的元素按行存放到集合中
            }
            for(String stud:list){
                stu=stud.split(",");
                  if(xiug.equals(stu[1]))
                  {
                   //输出该学号的具体信息，，具体信息在stu数组中
                      name=stu[0];
                      sid=stu[1];
                      gender=stu[2];
                      birth=stu[3];
                      math= Integer.parseInt(stu[4]);
                      java= Integer.parseInt(stu[5]);
                      pe= Integer.parseInt(stu[6]);
                    return  1;
                }
            }
            return 0;
        }

   }
