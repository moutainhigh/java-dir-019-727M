package main.student.ext;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class del {
    public static boolean de(String searchTxt) throws IOException {

        String[] stu = new String[7];
        String iddelete = searchTxt;
        File file = new File("main/handler/txt/student.txt");
        FileInputStream input = new FileInputStream(file);
        BufferedReader reader = new BufferedReader(new InputStreamReader(input));
        String tempstring;
        List<String> list = new ArrayList<>();
        while ((tempstring = reader.readLine()) != null) {
            list.add(tempstring);//文件中的元素按行存放到集合中
        }
        for (String stud : list) {
            stu = stud.split(",");
            if (iddelete.equals(stu[1])) {
                list.remove(stud);//删除符合要求的同学
                FileWriter fd = new FileWriter(file, false);
                fd.write("");//清空文件内容
                fd.close();
                break;
            }
        }
        FileWriter fd = new FileWriter(file, true);
        if (file.length() != 0) {
            fd.close();
            return false;
        }

        for (String stud1 : list) {
            stu = stud1.split(",");//集合中的元素以"，"为分隔符
            fd.write((stu[0]) + "," + (stu[1]) + "," + (stu[2]) + "," + (stu[3]) + "," + (stu[4]) + "," + (stu[5]) + "," + (stu[6]) + "\n");
        }
        fd.close();
        return true;
    }
}
